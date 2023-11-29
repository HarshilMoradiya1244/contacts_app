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
  ContactProvider? providerR;
  ContactProvider? providerW;

  @override
  Widget build(BuildContext context) {
    ContactModel c1 =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact Info"),
          actions: [
            IconButton(
              onPressed: () {
                providerR!.shareData(c1);
              },
              icon: const Icon(Icons.share, color: Colors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              c1.imagePath == null
                  ? CircleAvatar(
                      radius: 70,
                      child: Text("${c1.name?.substring(0, 1).toUpperCase()}",
                          style: Theme.of(context).textTheme.titleLarge),
                    )
                  : CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(File("${c1.imagePath}")),
                    ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${c1.name}",
                    // "Name: ${c1.name}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              const Divider(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "+91 ${c1.contact}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Text("Mobile | India")
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: IconButton(
                            onPressed: () async {
                              Uri uri = Uri.parse("tel: +91${c1.contact}");
                              await launchUrl(uri);
                            },
                            icon: const Icon(Icons.call),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${c1.email}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Text("Email")
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: IconButton(
                            onPressed: () async {
                              Uri uri = Uri.parse("mailto: ${c1.email}");
                              await launchUrl(uri);
                            },
                            icon: const Icon(Icons.email),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${c1.contact}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Text("Massage",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: IconButton(
                            onPressed: () async {
                              Uri uri = Uri.parse("sms: ${c1.contact}");
                              await launchUrl(uri);
                            },
                            icon: const Icon(Icons.message),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          "Video Call",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.video_call),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          "WhatsApp Call",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.call_sharp),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          "Gujarat",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.redAccent),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          showWidget(context, c1);
                        },
                        icon: const Icon(Icons.edit_outlined,
                            color: Colors.black, size: 30),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                          onPressed: () {
                            providerR!.contactDelete();
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.black, size: 30)),
                      const SizedBox(height: 10),
                      IconButton(
                          onPressed: () {
                            if (providerR!.isLock == true) {
                              providerR!.unHideContact();
                            } else {
                              providerR!.hideContact();
                            }
                            Navigator.pop(context);
                          },
                          icon: providerR!.isLock
                              ? const Icon(Icons.visibility_off_outlined,
                                  color: Colors.black, size: 30)
                              : const Icon(Icons.visibility,
                                  color: Colors.black, size: 30)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
