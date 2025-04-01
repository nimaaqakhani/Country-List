import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

/// [AuthEvent] : An event class for authentication-related actions.
/// 
/// This class defines all the events related to authentication. It uses the [freezed] package to provide 
/// immutable and union types for events, making it easier to handle different authentication actions in 
/// a type-safe manner.
///
/// ### Events:
/// 
/// - [login]:
///   - **Parameters**:
///     - `email`: The user's email address for authentication.
///     - `password`: The user's password for authentication.
///   - **Behavior**:
///     - This event triggers the login process, passing the user's credentials (email and password).
///     - The event is then processed by the [AuthBloc] to initiate the authentication process.
///
/// ### Usage:
/// ```dart
/// final loginEvent = AuthEvent.login('test@example.com', 'password123');
/// ```
@freezed
class AuthEvent with _$AuthEvent {
  /// Event for triggering the login process.
  const factory AuthEvent.login(String email, String password) = _Login;
}
