import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(AppConstants.splashDelay, () {
      context.go(AppConstants.homeRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          AppConstants.splashWelcomeText,
          style: TextStyle(
            fontSize: AppConstants.splashFontSize,
            fontWeight: AppConstants.splashFontWeight,
          ),
        ),
      ),
    );
  }
}