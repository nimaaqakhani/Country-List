import 'package:flutter/material.dart';

/// [CustomTextField] : A custom text input widget with additional functionalities like validation and suffix icon.
///
/// This widget provides a flexible and customizable text input field that can be used for various purposes such as
/// entering text, email, password, and more. It also supports validation, optional password obscurity, and the use
/// of a suffix icon (e.g., for toggling password visibility).
///
/// ### Properties:
/// - `controller`: A [TextEditingController] used to control the text input.
/// - `labelText`: The label text to be displayed in the input field.
/// - `keyboardType`: The type of keyboard to use for the input (e.g., text, email, number). Defaults to [TextInputType.text].
/// - `obscureText`: A flag to indicate whether the input should be obscured (e.g., for passwords). Defaults to `false`.
/// - `validator`: A function that validates the input text and returns an error message if invalid.
/// - `suffixIcon`: An optional icon to be displayed at the end of the text field (e.g., for password visibility toggle).
/// - `onSuffixTap`: A callback function to be invoked when the suffix icon is tapped (e.g., to toggle password visibility).
///
/// ### Example usage:
/// ```dart
/// CustomTextField(
///   controller: _controller,
///   labelText: 'Email',
///   keyboardType: TextInputType.emailAddress,
///   validator: (value) => value?.isEmpty ?? true ? 'Please enter a valid email' : null,
///   suffixIcon: Icons.visibility,
///   onSuffixTap: () => _togglePasswordVisibility(),
/// );
/// ```
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        errorText: validator?.call(controller.text),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onSuffixTap,
              )
            : null,
      ),
    );
  }
}
