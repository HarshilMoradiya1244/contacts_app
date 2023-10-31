import 'package:contacts_app/provider/share_helper.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight = true;

  void changeThem() {
    ShareHelper shr = ShareHelper();
    shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}
