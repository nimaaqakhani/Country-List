// lib/features/Auth/presentation/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_form.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_button.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_status.dart';

class LoginScreen extends StatelessWidget {
  final String successRoute;
  final AuthBloc authBloc;

  const LoginScreen({
    super.key,
    required this.successRoute,
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _LoginContent(
            successRoute: successRoute,
            authBloc: authBloc,
          ),
        ),
      ),
    );
  }
}

class _LoginContent extends StatefulWidget {
  final String successRoute;
  final AuthBloc authBloc;

  const _LoginContent({
    required this.successRoute,
    required this.authBloc,
  });

  @override
  State<_LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<_LoginContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginForm(
          formKey: _formKey,
          emailController: _emailController,
          passwordController: _passwordController,
          onSubmit: (email, password) {
            widget.authBloc.add(AuthEvent.login(email, password));
          },
        ),
        const SizedBox(height: 24),
        LoginButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final email = _emailController.text.trim();
              final password = _passwordController.text.trim();
              widget.authBloc.add(AuthEvent.login(email, password));
            }
          },
        ),
        const SizedBox(height: 16),
        LoginStatus(successRoute: widget.successRoute),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}