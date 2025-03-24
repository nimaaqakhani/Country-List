// lib/features/Auth/presentation/screens/advanced_login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/utils/auth_validator.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_button.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_status.dart';

class AdvancedLoginScreen extends StatelessWidget {
  final String successRoute;
  final AuthBloc authBloc;

  const AdvancedLoginScreen({
    super.key,
    required this.successRoute,
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _AdvancedLoginContent(successRoute: successRoute),
            ),
          ),
        ),
      ),
    );
  }
}

class _AdvancedLoginContent extends StatefulWidget {
  final String successRoute;

  const _AdvancedLoginContent({required this.successRoute});

  @override
  State<_AdvancedLoginContent> createState() => _AdvancedLoginContentState();
}

class _AdvancedLoginContentState extends State<_AdvancedLoginContent> {
  final _validator = AuthValidator();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => _validator.updateEmail(_emailController.text));
    _passwordController.addListener(() => _validator.updatePassword(_passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Icon(
              Icons.lock,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'ورود حرفه‌ای',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 40),
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
                obscureText: _obscurePassword,
                validator: (value) => snapshot.hasError ? snapshot.error.toString() : null,
                suffixIcon: _obscurePassword ? Icons.visibility : Icons.visibility_off,
                onSuffixTap: () => setState(() => _obscurePassword = !_obscurePassword),
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
      ),
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