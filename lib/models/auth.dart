import 'package:shared_preferences/shared_preferences.dart';

class auth {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String cookies;
  bool authonticated = false;
  // Storing data
  void storeData(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

// Retrieving data
 Future<String?> getData(String key) async {
    final SharedPreferences prefs = await _prefs;
    final String? action = prefs.getString(key);
    return action;
  }

// Removing data
  void removeData(String key) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }
}
