import 'package:flutter/material.dart';
import 'package:test_example/features/home/home_screen.dart';
import 'package:test_example/features/onboarding/onboarding_screen.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key, this.isSubscribed = false});

  final bool isSubscribed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isSubscribed ? HomeScreen() : OnboardingScreen(),
    );
  }
}
