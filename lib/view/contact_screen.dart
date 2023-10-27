import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/thme_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact App"),
          actions: [
            Consumer<ThemeProvider>(
                builder: (context, value, child) => Switch(value: value.isLight, onChanged: (value1) {
                  value.changeThem();
                },)
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text("Heloo",style: Theme.of(context).textTheme.titleLarge,),
              Text("Heloo",style: Theme.of(context).textTheme.titleMedium,),
              Text("Heloo",style: Theme.of(context).textTheme.titleLarge,),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context,'addContact' );
          },child: Icon(Icons.add),
        ),
      ),
    );
  }
}
