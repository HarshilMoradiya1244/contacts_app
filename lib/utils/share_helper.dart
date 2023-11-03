import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  void setIntroStatus() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("intro", true);
  }

  Future<bool?> getIntroStatus() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? status = await shr.getBool("intro");
    return status;
  }

  void setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("theme", true);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = await shr.getBool("theme");
    return isTheme;
  }
}