import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<void> saveFavorites(List<String> favorites) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', favorites);
  }

  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }
}
