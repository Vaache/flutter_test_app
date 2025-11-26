import 'package:flutter/material.dart';

class PaywallCard extends StatelessWidget {
  const PaywallCard(
      {super.key,
      required this.plan,
      this.selectedPlan = 'Месяц',
      required this.onChange});

  final String plan;
  final String selectedPlan;
  final void Function(String plan) onChange;

  @override
  Widget build(BuildContext context) {
    final isCurrentPlanSelected = selectedPlan == plan;

    return GestureDetector(
      onTap: () => onChange(plan),
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isCurrentPlanSelected
                ? Colors.amber.withValues(alpha: .1)
                : Colors.black.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: isCurrentPlanSelected ? Colors.amber : Colors.black)),
        child: Center(
            child: Text(
                plan == 'Месяц' ? '\$5 За Месяц' : "\$40 За Год (Скидка 65%)")),
      ),
    );
  }
}
