import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/modern_login_content.dart';

/// [ModernLoginScreen] : A screen that handles the modern login UI with gradient background and state management.
/// 
/// This screen is responsible for displaying the modern login interface. It manages different UI states such as loading,
/// error, and success using the [AuthBloc]. The screen utilizes a gradient background and shows various content based on the
/// authentication state. The screen will navigate to a new route upon successful login.
///
/// ### Parameters:
/// - `successRoute`:
///   - **Type**: [String]
///   - **Description**: The route to navigate to after a successful login. This is passed to the [ModernLoginContent] widget.
///
/// ### Behavior:
/// - **Loading**: Displays a loading state while the authentication process is ongoing using the [LoadingList] widget.
/// - **Error**: Shows an error message if the login attempt fails, using the [ErrorState] widget.
/// - **Success**: Renders the [ModernLoginContent] widget when the login is successful or when there is no ongoing process.
///
/// ### UI Components:
/// - **Gradient Background**: The screen uses a gradient background with two theme colors: primary and secondary.
/// - **BlocBuilder**: Listens to changes in the authentication state and updates the UI accordingly (loading, error, or success).
///   - Uses [LoadingList] to indicate loading.
///   - Uses [ErrorState] to display error messages.
/// - **ModernLoginContent**: Displays the content for the modern login form if there is no ongoing authentication process.
///
/// ### Usage:
/// ```dart
/// ModernLoginScreen(successRoute: '/home');
/// ```
class ModernLoginScreen extends StatelessWidget {
  final String successRoute;

  const ModernLoginScreen({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary.withOpacity(0.6),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const LoadingList(),
                  error: (message) => ErrorState(message: message),
                  orElse: () => ModernLoginContent(successRoute: successRoute),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
