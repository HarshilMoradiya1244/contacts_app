import 'package:contacts_app/view/add_contact_screen.dart';
import 'package:contacts_app/view/intro_screen.dart';
import 'package:flutter/cupertino.dart';

import '../view/contact_screen.dart';

Map<String,WidgetBuilder> screen_routes ={

  '/':(context) => IntroScreen(),
  'contact':(context) => ContactScreen(),
  'addContact':(context) => AddContactScreen(),
};
