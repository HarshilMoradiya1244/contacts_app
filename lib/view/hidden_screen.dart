import 'package:flutter/material.dart';

class HiddenScreen extends StatefulWidget {
  const HiddenScreen({super.key});

  @override
  State<HiddenScreen> createState() => _HiddenScreenState();
}

class _HiddenScreenState extends State<HiddenScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hidden Screen"),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),),
        ),
      ),
    );
  }
}
