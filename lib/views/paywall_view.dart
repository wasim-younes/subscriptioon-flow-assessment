import 'package:ai_paywall_task/models/plan.dart';
import 'package:ai_paywall_task/viewmodels/paywall_vm.dart';
import 'package:ai_paywall_task/views/widgets/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaywallView extends StatelessWidget {
  const PaywallView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaywallViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Choose a Plan')),
        body: Consumer<PaywallViewModel>(
          builder: (context, vm, _) {
            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                ...SubscriptionPlan.plans.map(
                  (plan) => Stack(
                    children: [
                      PlanCard(plan: plan),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.orange,
                          child: Text(
                            "BEST VALUE",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PurchaseButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PaywallViewModel>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: vm.selectedPlan != null ? () => vm.purchase(context) : null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
        ), // disable button if no plan selected
        child: Text('Purchase'),
      ),
    );
  }
}
