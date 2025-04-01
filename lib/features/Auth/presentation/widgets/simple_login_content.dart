import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/utils/auth_validator.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_status.dart';

/// [SimpleLoginContent] : A simple login form with email and password fields.
///
/// This widget provides a basic login form with email and password input fields. It includes form validation
/// for both fields and triggers the login process when the form is valid. The login status is managed using the
/// [AuthBloc] and the form displays an appropriate message on success.
///
/// ### Properties:
/// - `successRoute`: The route to navigate to upon successful login.
///
/// ### Example usage:
/// ```dart
/// SimpleLoginContent(successRoute: '/home');
/// ```
///
/// This widget is suitable for applications where a straightforward login form is needed without animations.
class SimpleLoginContent extends StatefulWidget {
  final String successRoute;

  const SimpleLoginContent({super.key, required this.successRoute});

  @override
  State<SimpleLoginContent> createState() => _SimpleLoginContentState();
}

class _SimpleLoginContentState extends State<SimpleLoginContent> {
  final _validator = AuthValidator();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => _validator.updateEmail(_emailController.text));
    _passwordController.addListener(() => _validator.updatePassword(_passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<String?>(
          stream: _validator.emailStream,
          builder: (context, snapshot) {
            return CustomTextField(
              controller: _emailController,
              labelText: 'ایمیل',
              keyboardType: TextInputType.emailAddress,
              validator: (value) => snapshot.hasError ? snapshot.error.toString() : null,
            );
          },
        ),
        const SizedBox(height: 16),
        StreamBuilder<String?>(
          stream: _validator.passwordStream,
          builder: (context, snapshot) {
            return CustomTextField(
              controller: _passwordController,
              labelText: 'رمز عبور',
              obscureText: true,
              validator: (value) => snapshot.hasError ? snapshot.error.toString() : null,
            );
          },
        ),
        const SizedBox(height: 24),
        StreamBuilder<bool>(
          stream: _validator.isFormValid,
          initialData: false,
          builder: (context, snapshot) {
            return FilledButton(
              onPressed: snapshot.data == true
                  ? () {
                      context.read<AuthBloc>().add(
                            AuthEvent.login(_validator.email, _validator.password),
                          );
                    }
                  : null,
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('ورود'),
            );
          },
        ),
        const SizedBox(height: 16),
        LoginStatus(successRoute: widget.successRoute),
      ],
    );
  }

  @override
  void dispose() {
    _validator.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
