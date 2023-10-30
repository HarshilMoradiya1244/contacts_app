import 'dart:html';

import 'package:contacts_app/provider/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title:"Title of custom button page",
              body:"This is a description on a page with a custom button below." ,
              image: Image.asset("assets/images/phone-call.png",)
            ),
            PageViewModel(
              title:"Title of custom button page",
              body:"This is a description on a page with a custom button below." ,
              image: Image.asset("assets/images/contacts.png",)
            ),
          ],
          showDoneButton: true,
          onDone:(){
           ShareHalper shr = ShareHalper();
            shr.setIntroStatus();
            Navigator.pushReplacementNamed(context, 'contact');
          },
          done: Text("Done"),
          showNextButton: true,
          next: Text("Next"),
        ),
      ),
    );
  }
}
