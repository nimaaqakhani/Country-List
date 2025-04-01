import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// [LoginSelectorScreen] : A screen for selecting different types of login screens.
/// 
/// This screen presents a simple UI with buttons that allow the user to choose between different login options:
/// simple login, modern login, and advanced login. Each button navigates to a specific login page using the 
/// [GoRouter] navigation system.
///
/// ### UI Components:
/// - **AppBar**: Displays a title at the top of the screen, indicating that the user is selecting a login page.
/// - **FilledButton**: Three buttons are displayed, each navigating to a different login screen (`/login/simple`, `/login/modern`, `/login/advanced`).
/// - **Center**: Centers the content of the screen both vertically and horizontally.
/// - **Column**: Organizes the buttons vertically with spacing between them using `SizedBox`.
/// 
/// ### Usage:
/// ```dart
/// Navigator.push(
///   context, 
///   MaterialPageRoute(builder: (context) => LoginSelectorScreen()),
/// );
/// ```
/// When the user presses one of the buttons, they are navigated to the corresponding login page.
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
