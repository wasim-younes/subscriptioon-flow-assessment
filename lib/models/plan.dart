class SubscriptionPlan {
  final String title;
  final double price;
  final bool isYearly;

  SubscriptionPlan({
    required this.title,
    required this.price,
    required this.isYearly,
  });

  // Static list of plans
  static final List<SubscriptionPlan> plans = [
    SubscriptionPlan(title: 'Monthly', price: 10.0, isYearly: false),
    SubscriptionPlan(title: 'Yearly', price: 80.0, isYearly: true),
  ];
}
