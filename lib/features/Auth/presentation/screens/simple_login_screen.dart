import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/simple_login_content.dart';

/// [SimpleLoginScreen] : A screen for displaying the simple login UI with basic authentication state handling.
/// 
/// This screen is used for the simple login interface. It displays a loading indicator, error message, or the login content 
/// based on the authentication state, which is managed using [AuthBloc]. The user is able to attempt login, and upon success, 
/// the app will navigate to a new route specified by the [successRoute] parameter.
///
/// ### Parameters:
/// - `successRoute`:
///   - **Type**: [String]
///   - **Description**: The route to navigate to upon successful login. This is passed to the [SimpleLoginContent] widget.
///
/// ### Behavior:
/// - **Loading**: Displays a loading spinner when the authentication process is ongoing, using the [LoadingList] widget.
/// - **Error**: Shows an error message if the login attempt fails, using the [ErrorState] widget.
/// - **Success**: Displays the login form content when the login attempt is not loading or showing errors.
///
/// ### UI Components:
/// - **AppBar**: The app bar contains a title for the login screen.
/// - **BlocBuilder**: Listens to changes in the authentication state and updates the UI accordingly (loading, error, or success).
///   - Displays [LoadingList] during loading state.
///   - Displays [ErrorState] with the error message if login fails.
///   - Displays the [SimpleLoginContent] widget when there is no loading or error.
///
/// ### Usage:
/// ```dart
/// SimpleLoginScreen(successRoute: '/home');
/// ```
class SimpleLoginScreen extends StatelessWidget {
  final String successRoute;

  const SimpleLoginScreen({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingList(),
              error: (message) => ErrorState(message: message),
              orElse: () => SimpleLoginContent(successRoute: successRoute),
            );
          },
        ),
      ),
    );
  }
}
