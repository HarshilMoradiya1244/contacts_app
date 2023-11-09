import 'dart:io';

import 'package:contacts_app/model/contact_model.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:contacts_app/widget/update_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  bool islock=false;
  @override
  Widget build(BuildContext context) {
    ContactModel c1 =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contact Info",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ContactProvider>().shareData(c1);
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.30,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      c1.imagePath == null
                          ? CircleAvatar(
                              radius: 80,
                              child: Text(
                                "${c1.name?.substring(0, 1).toUpperCase()}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  FileImage(File("${c1.imagePath}")),
                            ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "${c1.name}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.56,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(color: Colors.white),
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
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () async {
                                        Uri uri =
                                            Uri.parse("tel:+91${c1.contact}");
                                        await launchUrl(uri);
                                      },
                                      icon: const Icon(Icons.call),
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: IconButton(
                                      onPressed: () async {
                                        Uri uri =
                                            Uri.parse("sms:+91${c1.contact}");
                                        await launchUrl(uri);
                                      },
                                      icon: const Icon(Icons.message),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      const Divider(
                        color: Colors.grey,
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
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    const Text(
                                      "Email",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: IconButton(
                                      onPressed: () async {
                                        Uri uri =
                                            Uri.parse("mailto:+91${c1.email}");
                                        await launchUrl(uri);
                                      },
                                      icon: const Icon(Icons.email_outlined),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Video Call",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.video_call_outlined),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Column(
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
                                const Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.location_on_outlined),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          )),
                      const Divider(
                        color: Colors.grey,
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
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () {
                                        showWidget(context, c1);
                                      },
                                      icon: const Icon(Icons.edit),
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: IconButton(
                                      onPressed: () {
                                        context
                                            .read<ContactProvider>()
                                            .contactDelete();
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<ContactProvider>().hideContact();
                                        Navigator.pop(context);
                                      },
                                      icon:  islock?const Icon(Icons.lock_open_outlined):const Icon(Icons.lock),
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
