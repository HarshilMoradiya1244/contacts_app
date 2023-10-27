import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier{

  int stepindex =0;

  void nextStep (){
    if(stepindex < 4){
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
}