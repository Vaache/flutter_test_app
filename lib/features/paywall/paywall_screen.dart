import 'package:flutter/material.dart';
import 'package:test_example/core/paywall_service/paywall_service.dart';
import 'package:test_example/features/home/home_screen.dart';
import 'package:test_example/features/paywall/widgets/paywall_card.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  String selectedPlan = 'Месяц';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Экран Подписки'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaywallCard(
              plan: 'Месяц',
              selectedPlan: selectedPlan,
              onChange: (plan) {
                setState(() {
                  selectedPlan = plan;
                });
              },
            ),
            PaywallCard(
              plan: 'Год',
              selectedPlan: selectedPlan,
              onChange: (plan) {
                setState(() {
                  selectedPlan = plan;
                });
              },
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: ElevatedButton(
                    onPressed: () async {
                      await PaywallService().subscribe(selectedPlan);
                      if (context.mounted && mounted) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      }
                    },
                    child: Text('Продолжить')))
          ],
        ),
      ),
    );
  }
}
