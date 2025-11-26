import 'package:flutter/material.dart';
import 'package:test_example/core/paywall_service/paywall_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? plan;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final payedPlan = await PaywallService().getSubPlan();
      if (payedPlan != null) {
        setState(() {
          plan = payedPlan;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Добро пожаловать в Домацный экран!'),
              if (plan != null)
                Text(
                    'Вам текущий план ${plan == 'Месяц' ? 'Месячный' : 'Годовой'}')
            ],
          ),
        ),
      ),
    );
  }
}
