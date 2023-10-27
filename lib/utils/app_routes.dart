import 'package:contacts_app/view/add_contact_screen.dart';
import 'package:flutter/cupertino.dart';

import '../view/contact_screen.dart';

Map<String,WidgetBuilder> screen_routes ={

  '/':(context) => ContactScreen(),
  'addContact':(context) => AddContactScreen(),
};
