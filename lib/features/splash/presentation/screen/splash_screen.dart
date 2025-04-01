import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// SplashScreen widget that displays a welcome message and a loading indicator
/// while navigating to the login selector screen after a delay.
///
/// This screen is shown when the app is launched and it automatically navigates 
/// to the `/login-selector` route after 3 seconds.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  /// Initializes the screen and sets up a delayed navigation to the login selector screen.
  @override
  void initState() {
    super.initState();
    
    // Navigates to '/login-selector' after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Ensure the widget is still in the widget tree before navigating
        context.go('/login-selector');
      }
    });
  }

  /// Builds the UI for the SplashScreen, showing an icon, welcome message, and loading indicator.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying Flutter icon in the center
            Icon(
              Icons.flutter_dash,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            
            // Displaying the welcome message
            Text(
              'خوش آمدید',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            
            // Circular progress indicator while the app is loading
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
