import 'package:factoryapp/login/screens/Welcome/welcome_screen.dart';
import 'package:factoryapp/main.dart';
import 'package:factoryapp/splash/flutterlogo.dart';
import 'package:flutter/material.dart';

// Import onboarding screen 1
import 'package:factoryapp/onboarding/screen_one.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    // If the user starts the app for the first time, show the onboarding screen
    if (initScreen == 0 || initScreen == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreenOne()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: const FlutterScreen())],
        ),
      ),
    );
  }
}
