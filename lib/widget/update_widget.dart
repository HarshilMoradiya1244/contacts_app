import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/contact_model.dart';
import '../provider/contact_provider.dart';

void showWidget(BuildContext context,ContactModel c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtContact = TextEditingController(text: c1.contact);
  TextEditingController txtEmail = TextEditingController(text: c1.email);


  showDialog(
    context: context,
    builder: (context) {
      return  SingleChildScrollView(
        child: AlertDialog(
          title: const Text("Update Contacts"),
          actions: [
            Align(alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        alignment: Alignment.bottomCenter,
                        title: const Text("Pick Profile Picture"),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                context.read<ContactProvider>().updateImagePath(image!.path);
                              },
                              child: const Text("Choose Photo")),
                          TextButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? image = await picker.pickImage(
                                    source: ImageSource.camera);
                                context.read<ContactProvider>().updateImagePath(image!.path);
                              },
                              child: const Text("Take Photo")),
                        ],
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(File("${c1.imagePath}")),

                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: txtName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name")
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: txtContact,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Contact")
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email")
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              ContactModel c1 = ContactModel();
              c1.name=txtName.text;
              c1.contact=txtContact.text;
              c1.email=txtEmail.text;
              c1.imagePath=context.read<ContactProvider>().path;
              context.read<ContactProvider>().editContact(c1);
              Navigator.pop(context);
              Navigator.pop(context);
            },child: const Text("Update"),)
          ],
        ),
      );
    },
  );
}