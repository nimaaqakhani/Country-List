// lib/features/Auth/presentation/utils/auth_validator.dart
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class AuthValidator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Getterها برای دسترسی به Streamها
  Stream<String?> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String?> get passwordStream => _passwordController.stream.transform(validatePassword);
  Stream<bool> get isFormValid =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => e != null && p != null);

  // اعتبارسنجی ایمیل
  StreamTransformer<String, String?> get validateEmail =>
      StreamTransformer<String, String?>.fromHandlers(
        handleData: (email, sink) {
          if (email.isEmpty) {
            sink.addError('لطفاً ایمیل را وارد کنید');
          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
            sink.addError('ایمیل نامعتبر است');
          } else {
            sink.add(email);
          }
        },
      );

  // اعتبارسنجی رمز عبور
  StreamTransformer<String, String?> get validatePassword =>
      StreamTransformer<String, String?>.fromHandlers(
        handleData: (password, sink) {
          if (password.isEmpty) {
            sink.addError('لطفاً رمز عبور را وارد کنید');
          } else if (password.length < 8) {
            sink.addError('رمز عبور باید حداقل ۸ کاراکتر باشد');
          } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
            sink.addError('رمز عبور باید حداقل یک حرف بزرگ داشته باشد');
          } else if (!RegExp(r'(?=.*[0-9])').hasMatch(password)) {
            sink.addError('رمز عبور باید حداقل یک عدد داشته باشد');
          } else if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(password)) {
            sink.addError('رمز عبور باید حداقل یک کاراکتر خاص داشته باشد');
          } else {
            sink.add(password);
          }
        },
      );

  // متدهای کمکی برای به‌روزرسانی Streamها
  void updateEmail(String email) => _emailController.add(email);
  void updatePassword(String password) => _passwordController.add(password);

  // متد برای گرفتن مقادیر فعلی
  String get email => _emailController.valueOrNull ?? '';
  String get password => _passwordController.valueOrNull ?? '';

  // Dispose کردن Streamها
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}