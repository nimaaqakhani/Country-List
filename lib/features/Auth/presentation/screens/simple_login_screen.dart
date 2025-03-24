import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: _emailController,
            labelText: 'ایمیل',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'لطفاً ایمیل را وارد کنید';
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'ایمیل نامعتبر است';
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordController,
            labelText: 'رمز عبور',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'لطفاً رمز عبور را وارد کنید';
              return null;
            },
          ),
          const SizedBox(height: 24),
          LoginButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      AuthEvent.login(_emailController.text, _passwordController.text),
                    );
              }
            },
          ),
          const SizedBox(height: 16),
          LoginStatus(successRoute: widget.successRoute),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}