import 'package:contacts_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> addContactList = [];

  int stepindex = 0;
  String? imagePath;
  String? path;

  void nextStep() {
    if (stepindex < 3) {
      stepindex++;
    }
    notifyListeners();
  }

  void cancelStep() {
    if (stepindex > 0) {
      stepindex--;
    }
    notifyListeners();
  }

  void addContactData(ContactModel cm) {
    addContactList.add(cm);
    notifyListeners();
  }

  void updateImagePath(String newPath) {
    path = newPath;
    notifyListeners();
  }
}
