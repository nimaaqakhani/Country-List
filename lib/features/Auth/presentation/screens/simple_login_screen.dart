// lib/features/Auth/presentation/screens/simple_login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/utils/auth_validator.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_button.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_status.dart';

class SimpleLoginScreen extends StatelessWidget {
  final String successRoute;
  final AuthBloc authBloc;

  const SimpleLoginScreen({
    super.key,
    required this.successRoute,
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Simple Login')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _SimpleLoginContent(successRoute: successRoute),
        ),
      ),
    );
  }
}

class _SimpleLoginContent extends StatefulWidget {
  final String successRoute;

  const _SimpleLoginContent({required this.successRoute});

  @override
  State<_SimpleLoginContent> createState() => _SimpleLoginContentState();
}

class _SimpleLoginContentState extends State<_SimpleLoginContent> {
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
            return LoginButton(
              onPressed: snapshot.data == true
                  ? () {
                      context.read<AuthBloc>().add(
                            AuthEvent.login(_validator.email, _validator.password),
                          );
                    }
                  : null,
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