import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/core/route/router.dart';

void main() {
  Injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router, 
    );
  }
}