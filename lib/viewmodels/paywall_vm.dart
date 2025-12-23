import 'package:ai_paywall_task/models/plan.dart';
import 'package:ai_paywall_task/services/sub_service.dart';
import 'package:ai_paywall_task/views/home_view.dart';
import 'package:flutter/material.dart';

/// ViewModel to handle subscription/paywall logic
class PaywallViewModel extends ChangeNotifier {
  SubscriptionPlan? _selectedPlan;

  SubscriptionPlan? get selectedPlan => _selectedPlan;

  void selectPlan(SubscriptionPlan plan) {
    _selectedPlan = plan;
    notifyListeners();
  }

  /// Simulates a purchase, marks user as subscribed, and navigates to HomeView
  Future<void> purchase(BuildContext context) async {
    if (_selectedPlan == null) return;

    // Set subscription status
    await SubscriptionService.setIsSubscribed(true);

    // Navigate to HomeView and remove previous routes
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeView()),
        (route) => false,
      );
    }
  }
}

/// ViewModel to handle onboarding page state
class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage(int totalPages) {
    if (_currentPage < totalPages - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }
}
