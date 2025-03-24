import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/utils/auth_validator.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/login_status.dart';

class ModernLoginContent extends StatefulWidget {
  final String successRoute;

  const ModernLoginContent({super.key, required this.successRoute});

  @override
  State<ModernLoginContent> createState() => _ModernLoginContentState();
}

class _ModernLoginContentState extends State<ModernLoginContent> with SingleTickerProviderStateMixin {
  final _validator = AuthValidator();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => _validator.updateEmail(_emailController.text));
    _passwordController.addListener(() => _validator.updatePassword(_passwordController.text));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: Text(
            'ورود به برنامه',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 32),
        SlideTransition(
          position: _slideAnimation,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        LoginStatus(successRoute: widget.successRoute),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _validator.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}