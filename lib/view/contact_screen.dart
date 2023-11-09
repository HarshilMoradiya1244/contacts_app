import 'dart:io';

import 'package:contacts_app/utils/color_list.dart';
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

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact App"),
          actions: [
            IconButton(onPressed: () async {
              providerR!.bioMatrix();
             await Navigator.pushNamed(context, 'hidden');
      }, icon: Icon(Icons.remove_red_eye_outlined)),
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
          itemCount: providerW!.addContactList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                  providerR!.storeIndex(index);
                  Navigator.pushNamed(context, 'contactInfo',arguments: providerR!.addContactList[index]);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [providerW!.addContactList[index].imagePath != null  ? CircleAvatar(
                          radius: 25,
                          backgroundImage: FileImage(File("${providerW!.addContactList[index].imagePath}")),
                        ):
                        Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: boxcolorList[index],
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${providerW!.addContactList[index].name!.isNotEmpty ? providerW!.addContactList[index].name!.substring(0, 1).toUpperCase() : 0}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${providerR!.addContactList[index].name}"),
                            Text("${providerR!.addContactList[index].contact}"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addContact');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
