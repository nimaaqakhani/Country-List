import 'package:flutter/material.dart';

/// [LoginForm] : A form widget that takes email and password input and validates them.
///
/// This widget represents a login form with two fields: email and password. 
/// The form validates the email and password inputs to ensure they are not empty. 
/// Upon successful validation, the form can trigger a submission action.
///
/// ### Properties:
/// - `formKey`: A [GlobalKey] used to manage the state of the form. 
/// - `emailController`: A [TextEditingController] used to control the email input field.
/// - `passwordController`: A [TextEditingController] used to control the password input field.
/// - `onSubmit`: A callback function that is invoked when the form is submitted, providing the email and password.
///
/// ### Example usage:
/// ```dart
/// LoginForm(
///   formKey: _formKey,
///   emailController: _emailController,
///   passwordController: _passwordController,
///   onSubmit: (email, password) {
///     // Handle login submission here
///   },
/// );
/// ```
/// 
/// The form includes validation logic to ensure that the user has entered an email and password before submission.
/// If either field is empty, an error message will appear.
class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(String email, String password) onSubmit;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
