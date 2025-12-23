import 'package:ai_paywall_task/models/plan.dart';
import 'package:ai_paywall_task/viewmodels/paywall_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;

  const PlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PaywallViewModel>();
    final isSelected = vm.selectedPlan == plan;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: isSelected ? Colors.blue[50] : null,
      child: ListTile(
        title: Text(
          plan.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${plan.price.toStringAsFixed(2)} ${plan.isYearly ? "per year" : "per month"}',
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: Colors.blue)
            : null,
        onTap: () => vm.selectPlan(plan),
      ),
    );
  }
}
