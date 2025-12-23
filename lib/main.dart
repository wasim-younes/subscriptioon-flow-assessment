import 'package:ai_paywall_task/services/sub_service.dart';
import 'package:ai_paywall_task/views/home_view.dart';
import 'package:ai_paywall_task/views/onbooardinig_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isSubscribed = await SubscriptionService.getIsSubscribed();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isSubscribed ? const HomeView() : OnboardingView(),
    ),
  );
}
