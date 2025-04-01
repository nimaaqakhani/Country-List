import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';

/// [LoginButton] : A button that triggers the login action and displays loading indicator when necessary.
///
/// This widget represents a login button. When the user presses it, it triggers the [onPressed] callback. If the
/// authentication state is loading, a [CircularProgressIndicator] is shown instead of the button text. 
///
/// ### Properties:
/// - `onPressed`: A callback function to be invoked when the button is pressed. It is optional, meaning it can be
///   passed to the widget to handle the login process or any other action.
///
/// ### Example usage:
/// ```dart
/// LoginButton(
///   onPressed: () {
///     // Trigger the login action here.
///   },
/// );
/// ```
///
/// The button adapts its UI based on the current state of authentication:
/// - If the state is `loading`, it will display a loading spinner.
/// - Otherwise, it shows the login button.
class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed; 

  const LoginButton({super.key, this.onPressed}); 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          orElse: () => ElevatedButton(
            onPressed: onPressed,
            child: const Text('ورود'),
          ),
        );
      },
    );
  }
}
