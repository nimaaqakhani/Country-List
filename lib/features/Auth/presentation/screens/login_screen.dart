import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: () {
                    debugPrint('LoginScreen: Success state received, navigating to /home');
                    context.go('/home');
                  },
                  error: (message) => debugPrint('LoginScreen: Error state received: $message'),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    debugPrint('LoginScreen: Showing loading indicator');
                    return const CircularProgressIndicator();
                  },
                  error: (message) => Column(
                    children: [
                      ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 16),
                      Text(message, style: const TextStyle(color: Colors.red)),
                    ],
                  ),
                  orElse: () => ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: () => const Text('Login successful!', style: TextStyle(color: Colors.green)),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    debugPrint('LoginScreen: Login button pressed with email: $email');
    context.read<AuthBloc>().add(AuthEvent.login(email, password));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
// 