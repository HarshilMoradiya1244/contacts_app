import 'package:contacts_app/provider/share_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   bool? status;
  @override
  void initState() {
    super.initState();
  }
  void creat(){
   ShareHalper shr = ShareHalper();
   shr.getIntroStatus();
  }
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context,status==false || status==null? 'intro':'contact');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "assets/images/phone-book.png",
            height: 300,
          ),
        ),
      ),
    );
  }
}
