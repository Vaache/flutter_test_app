import 'package:shared_preferences/shared_preferences.dart';

class PaywallService {
  static const String sub = 'subscription';
  static const String subPlan = 'subscription_plan';

  Future<void> subscribe(String plan) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool(sub, true);
    prefs.setString(subPlan, plan);
  }

  Future<bool> getSubscriptionStatus() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(sub) ?? false;
  }

  Future<String?> getSubPlan() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(subPlan);
  }
}
