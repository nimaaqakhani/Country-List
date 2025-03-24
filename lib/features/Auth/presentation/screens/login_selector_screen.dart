// lib/features/Auth/presentation/screens/login_selector_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginSelectorScreen extends StatelessWidget {
  const LoginSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انتخاب صفحه لاگین'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => context.go('/login/simple'),
              child: const Text('لاگین ساده'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/login/modern'),
              child: const Text('لاگین مدرن'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/login/advanced'),
              child: const Text('لاگین حرفه‌ای'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
