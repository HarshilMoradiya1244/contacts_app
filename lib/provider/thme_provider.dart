import 'package:contacts_app/utils/share_helper.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight = true;

  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}
