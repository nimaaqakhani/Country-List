import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';

/// [LoginStatus] : A widget that listens for authentication state changes and shows a success message.
///
/// This widget listens to the authentication state through a [BlocListener] and triggers a success message
/// when the user logs in successfully. It displays a snackbar with a success message and redirects the user to
/// a specified route upon successful login.
///
/// ### Properties:
/// - `successRoute`: A string representing the route to navigate to after a successful login.
///
/// ### Example usage:
/// ```dart
/// LoginStatus(successRoute: '/home');
/// ```
///
/// The `LoginStatus` widget listens for changes in the [AuthBloc] and will trigger the snackbar and route change
/// when the `AuthState.success()` event occurs.
class LoginStatus extends StatelessWidget {
  final String successRoute;

  const LoginStatus({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  'ورود موفقیت‌آمیز بود! خوش اومدی 🎉',
                  style: TextStyle(fontSize: 16),
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                duration: const Duration(seconds: 2),
              ),
            );
            context.go(successRoute);
          },
          orElse: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
