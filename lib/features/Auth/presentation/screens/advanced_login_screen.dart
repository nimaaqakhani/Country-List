import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/advanced_login_content.dart';

/// [AdvancedLoginScreen] : A screen that handles the user interface for advanced login functionality.
/// 
/// This screen is responsible for displaying the login UI, managing the loading state, showing error messages, 
/// and triggering the login flow. It listens to the [AuthBloc] to update the UI based on the current authentication state.
/// 
/// ### Parameters:
/// - `successRoute`:
///   - **Type**: [String]
///   - **Description**: The route to navigate to upon successful login. This is passed to the [AdvancedLoginContent] widget.
///
/// ### Behavior:
/// - **Loading**: Displays a loading state while the authentication process is in progress.
/// - **Error**: Shows an error state with a message when the authentication fails.
/// - **Success**: Renders the login form when the authentication is not in progress or has been completed.
///
/// ### UI Components:
/// - **BlocBuilder**: Listens to the [AuthBloc] and builds the UI based on the [AuthState].
///   - Displays different widgets for loading, error, or the login form.
///   - Uses [LoadingList] to indicate loading and [ErrorState] to display error messages.
///
/// ### Usage:
/// ```dart
/// AdvancedLoginScreen(successRoute: '/home');
/// ```
class AdvancedLoginScreen extends StatelessWidget {
  final String successRoute;

  const AdvancedLoginScreen({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const LoadingList(),
                  error: (message) => ErrorState(message: message),
                  orElse: () =>
                      AdvancedLoginContent(successRoute: successRoute),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
