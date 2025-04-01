import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// [AuthState] : A state class that represents different authentication states.
/// 
/// This class defines the various states of the authentication process using the [freezed] package,
/// providing a sealed class-like structure. The different states represent the stages of authentication:
/// initial, loading, success, and error.
///
/// ### States:
/// 
/// - [initial]:
///   - **Description**: The initial state when no authentication action has been taken yet.
/// 
/// - [loading]:
///   - **Description**: The state when an authentication request (like login) is in progress.
/// 
/// - [success]:
///   - **Description**: The state when authentication is successfully completed.
/// 
/// - [error]:
///   - **Parameters**:
///     - `message`: A string describing the error encountered during authentication.
///   - **Description**: The state when an error occurs during the authentication process, carrying an error message.
///
/// ### Usage:
/// ```dart
/// final initialState = AuthState.initial();
/// final loadingState = AuthState.loading();
/// final successState = AuthState.success();
/// final errorState = AuthState.error('Invalid credentials');
/// ```
@freezed
class AuthState with _$AuthState {
  /// Represents the initial state before any authentication action.
  const factory AuthState.initial() = AuthInitial;

  /// Represents the state when authentication is in progress.
  const factory AuthState.loading() = AuthLoading;

  /// Represents the state when authentication is successful.
  const factory AuthState.success() = AuthSuccess;

  /// Represents the state when authentication fails.
  /// It contains an error message.
  const factory AuthState.error(String message) = AuthError;
}
