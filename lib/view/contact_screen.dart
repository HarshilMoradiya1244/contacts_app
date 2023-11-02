import 'package:contacts_app/utils/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';
import '../provider/thme_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.read<ContactProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact App"),
          actions: [
            Consumer<ThemeProvider>(
                builder: (context, value, child) => Switch(
                      value: value.isLight,
                      onChanged: (value1) {
                        ShareHelper shr = ShareHelper();
                        shr.setTheme(false);
                        value.changeThem();
                      },
                    ))
          ],
        ),
        body: ListView.builder(
          itemCount:providerW!.addContact.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.10,
              width: MediaQuery.of(context).size.width*0.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.18,
                    width: MediaQuery.of(context).size.width*0.20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pinkAccent
                    ),

                  ),
                  Column(
                    children: [
                      Text("${providerW!.addContact[index].name}"),
                      Text("${providerW!.addContact[index].contact}"),
                    ],
                  )
                ],),
              ),
            ),
          );
        },),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addContact');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
