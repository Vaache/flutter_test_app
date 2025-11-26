import 'package:flutter/material.dart';
import 'package:test_example/features/paywall/paywall_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Добро пожаловать!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PaywallScreen()));
                },
                child: Text('Продолжить'))
          ],
        ),
      ),
    );
  }
}
