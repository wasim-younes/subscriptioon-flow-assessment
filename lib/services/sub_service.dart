import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionService {
  static const String _keyIsSubscribed = 'isSubscribed';

  /// Sets the subscription status
  static Future<void> setIsSubscribed(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsSubscribed, value);
  }

  /// Gets the subscription status (defaults to false)
  static Future<bool> getIsSubscribed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsSubscribed) ?? false;
  }
}
