import 'dart:async';
import 'package:rxdart/rxdart.dart';

class AuthValidator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String?> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String?> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get isFormValid => Rx.combineLatest2(
      emailStream, passwordStream, (e, p) => e != null && p != null);

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

  void updateEmail(String email) => _emailController.add(email);
  void updatePassword(String password) => _passwordController.add(password);

  String get email => _emailController.valueOrNull ?? '';
  String get password => _passwordController.valueOrNull ?? '';

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
