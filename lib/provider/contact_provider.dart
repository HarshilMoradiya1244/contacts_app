import 'package:contacts_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:share_plus/share_plus.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> addContactList = [];
  List<ContactModel> hideContactList = [];

  int stepindex = 0;
  String? imagePath;
  String? path;
  int? infoIndex;
  bool isPrivate = false;

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


  void editContact(ContactModel c1) {
    if(isPrivate){
      hideContactList[infoIndex!]=c1;
    }
    else{
      addContactList[infoIndex!] = c1;
    }
    notifyListeners();
  }

  void contactDelete() {
    if(isPrivate){
      hideContactList.removeAt(infoIndex!);
    }
    else{
      addContactList.removeAt(infoIndex!);
    }
    notifyListeners();
  }

  void storeIndex(int index) {
    infoIndex = index;
  }

  Future<void> shareData(ContactModel c1) async {
    Share.share("${c1.name} \n ${c1.contact}");
    ShareResult result = await Share.shareWithResult("");
  }

  void hideContact() {
    ContactModel hiddenContact = addContactList[infoIndex!];
    hideContactList.add(hiddenContact);
    addContactList.removeAt(infoIndex!);
    notifyListeners();
  }
  void unHideContact() {
    ContactModel unHideContact = hideContactList [infoIndex!];
    addContactList.add(unHideContact);
    hideContactList.removeAt(infoIndex!);
    notifyListeners();
  }

Future<bool?> bioMatrix() async {
    LocalAuthentication auth = LocalAuthentication();
    bool checkBioMatrixStatus = await auth.canCheckBiometrics;
    if(checkBioMatrixStatus){
      List<BiometricType>biotypes = await auth.getAvailableBiometrics();
      if(biotypes.isNotEmpty){
        bool isAuth = await auth.authenticate(localizedReason: "Enter Your Privacy Password",options: AuthenticationOptions(
          biometricOnly: false,
          useErrorDialogs: true
        ),);
        return isAuth;
      }
    }
    return null;
}
}
