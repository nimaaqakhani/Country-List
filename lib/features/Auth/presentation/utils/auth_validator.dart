import 'dart:async';
import 'package:rxdart/rxdart.dart';

/// [AuthValidator] : A class for managing and validating authentication form input (email and password).
///
/// This class uses [BehaviorSubject] to handle streams of email and password inputs, and validates
/// them using custom [StreamTransformer]s. It provides streams for both the email and password fields 
/// with error handling based on the validation rules. Additionally, it has a stream that indicates whether 
/// the form is valid or not based on the validation of both fields.
///
/// ### Properties:
/// - `emailStream`: A [Stream<String?>] that listens to the email input and applies the email validation.
/// - `passwordStream`: A [Stream<String?>] that listens to the password input and applies the password validation.
/// - `isFormValid`: A [Stream<bool>] that checks if both the email and password inputs are valid.
/// 
/// ### Methods:
/// - `validateEmail`: A [StreamTransformer] that checks the email for correctness (empty, valid format).
/// - `validatePassword`: A [StreamTransformer] that checks the password for length, uppercase letter, 
///   number, and special character.
///
/// ### Usage:
/// Use this class to handle and validate form inputs for login or registration. You can subscribe 
/// to the streams to listen for validation errors and check if the form is valid.
class AuthValidator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  /// Stream that provides validation errors or valid email input.
  Stream<String?> get emailStream =>
      _emailController.stream.transform(validateEmail);

  /// Stream that provides validation errors or valid password input.
  Stream<String?> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  /// Stream that emits true if the form is valid (both email and password are valid), false otherwise.
  Stream<bool> get isFormValid => Rx.combineLatest2(
      emailStream, passwordStream, (e, p) => e != null && p != null);

  /// A transformer that validates the email field.
  StreamTransformer<String, String?> get validateEmail =>
      StreamTransformer<String, String?>.fromHandlers(
        handleData: (email, sink) {
          if (email.isEmpty) {
            sink.addError('ایمیل رو خالی نذار، لطفاً یه ایمیل وارد کن');
          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
            sink.addError('این ایمیل درست نیست، یه ایمیل معتبر وارد کن');
          } else {
            sink.add(email);
          }
        },
      );

  /// A transformer that validates the password field.
  StreamTransformer<String, String?> get validatePassword =>
      StreamTransformer<String, String?>.fromHandlers(
        handleData: (password, sink) {
          if (password.isEmpty) {
            sink.addError('رمز عبور رو وارد کن، نمی‌تونی خالی بذاری');
          } else if (password.length < 8) {
            sink.addError('رمزت خیلی کوتاهه، حداقل ۸ کاراکتر باید باشه.');
          } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
            sink.addError('یه حرف بزرگ (مثل A یا B) توی رمزت کمه.');
          } else if (!RegExp(r'(?=.*[0-9])').hasMatch(password)) {
            sink.addError('حداقل یه عدد (مثل 1 یا 2) به رمزت اضافه کن.');
          } else if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(password)) {
            sink.addError('یه کاراکتر خاص (مثل ! یا @) توی رمزت نیازه.');
          } else {
            sink.add(password);
          }
        },
      );

  /// Update the email in the controller and trigger validation.
  void updateEmail(String email) => _emailController.add(email);

  /// Update the password in the controller and trigger validation.
  void updatePassword(String password) => _passwordController.add(password);

  /// Get the latest email value or an empty string if no value is set.
  String get email => _emailController.valueOrNull ?? '';

  /// Get the latest password value or an empty string if no value is set.
  String get password => _passwordController.valueOrNull ?? '';

  /// Dispose the controllers to prevent memory leaks.
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
