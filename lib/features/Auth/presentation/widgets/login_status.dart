import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';

class LoginStatus extends StatelessWidget {
  final String successRoute;

  const LoginStatus({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            // نمایش SnackBar موفقیت
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
            // هدایت به صفحه‌ی بعدی
            context.go(successRoute);
          },
          orElse: () {},
        );
      },
      child: const SizedBox.shrink(), 
    );
  }
}