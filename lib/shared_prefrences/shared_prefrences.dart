import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService {
  static Future<Map<String, String?>> gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? fullName = prefs.getString("fullName");
    return {"token": token, "fullName": fullName};
  }
}
