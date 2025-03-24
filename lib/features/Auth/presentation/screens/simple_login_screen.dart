import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/simple_login_content.dart';

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