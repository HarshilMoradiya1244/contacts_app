import 'package:contacts_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> addContactList = [];

  int stepindex = 0;
  String? imagePath;
  String? path;
  int? infoIndex;

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

  void resetStep() {
    stepindex = 0;
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

  // void contactIndex() {
  //   index = infoIndex!;
  // }
  void editContact(ContactModel c1)
  {
    addContactList[infoIndex!]=ContactModel();
    notifyListeners();
  }

  void contactDelete() {
    addContactList.removeAt(infoIndex!);
    notifyListeners();
  }
  void storeIndex(int index){
    infoIndex = index;
  }
}
