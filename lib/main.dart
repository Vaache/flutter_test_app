import 'package:flutter/material.dart';
import 'package:test_example/core/paywall_service/paywall_service.dart';
import 'package:test_example/core/test_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isSubscribed = await PaywallService().getSubscriptionStatus();

  runApp(TestApp(
    isSubscribed: isSubscribed,
  ));
}
