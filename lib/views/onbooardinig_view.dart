import 'package:ai_paywall_task/viewmodels/onboarding_vm.dart';
import 'package:ai_paywall_task/views/paywall_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  final int _totalPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnboardingViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  vm.setPage(index);
                },
                children: [
                  _buildPage(
                    color: Colors.blue,
                    title: "Welcome",
                    subtitle: "Discover new features.",
                  ),
                  _buildPage(
                    color: Colors.green,
                    title: "Organize",
                    subtitle: "Keep everything in one place.",
                  ),
                  _buildPage(
                    color: Colors.orange,
                    title: "Get Started",
                    subtitle: "Let's begin your journey.",
                  ),
                ],
              ),
            ),
            _buildDots(vm.currentPage),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (vm.currentPage < _totalPages - 1) {
                    _pageController.animateToPage(
                      vm.currentPage + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => PaywallView()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  vm.currentPage == _totalPages - 1 ? "Get Started" : "Next",
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Container(
      color: color.withValues(alpha: 0.1),
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Icon(Icons.phone_iphone, size: 120, color: color),
            ),
          ),
          SizedBox(height: 32),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            subtitle,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDots(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
