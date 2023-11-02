import 'package:contacts_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier{

  List<ContactModel> addContact =[];

  int stepindex =0;

  void nextStep (){
    if(stepindex < 3){
      stepindex++;
    }
    notifyListeners();
  }
  void cancelStep (){
    if(stepindex > 0){
      stepindex--;
    }
    notifyListeners();
  }
  void addContactData(){

  }
}