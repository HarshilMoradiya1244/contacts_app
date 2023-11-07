import 'dart:io';

import 'package:contacts_app/model/contact_model.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_app/widget/update_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    ContactModel c1 =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact Info",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.30,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                     c1.imagePath == null ? CircleAvatar(
                        radius: 80,
                        child: Text("${c1.name?.substring(0,1).toUpperCase()}",style: Theme.of(context). textTheme.titleLarge,),
                      ):
                      CircleAvatar(
                        radius: 80,
                      backgroundImage: FileImage(File("${c1.imagePath}")),
                      ),
                      Spacer( ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "${c1.name}",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade500,
                  thickness: 1,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.56,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  "+91 ${c1.contact}",
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.black),
                                ),
                                Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.call),
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.blue),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.message),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${c1.email}",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.red),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.email_outlined),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Video Call",
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.black),
                                ),
                                Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.video_call_outlined),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gujrat",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Text(
                                      "India",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.red),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.location_on_outlined),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () {
                                     showWidget(context, c1);
                                      },
                                      icon: Icon(Icons.edit),
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.blue),
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<ContactProvider>().contactDelete();
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
