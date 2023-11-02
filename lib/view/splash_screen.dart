import 'package:contacts_app/utils/share_helper.dart';
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
    create();
  }

  void create() async {
    ShareHelper shr = ShareHelper();
    status = await shr.getIntroStatus();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, status == false || status == null ? 'intro' : 'contact');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "assets/images/phone-book.png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
