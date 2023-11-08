import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_app/provider/thme_provider.dart';
import 'package:contacts_app/utils/app_routes.dart';
import 'package:contacts_app/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        value.changeThem();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value.isLight ? lightTheme : darkTheme,
          routes: screen_routes,
        );
      }),
    ),
  );
}
