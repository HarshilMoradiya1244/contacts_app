import 'dart:io';
import 'package:contacts_app/model/contact_model.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Add Contacts",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ContactProvider>(
                builder: (context, value, child) => Theme(
                  data: ThemeData(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: Colors.grey,
                            background: Colors.grey,
                            secondary: Colors.grey,
                          )),
                  child: Stepper(
                    currentStep: value.stepindex,
                    onStepContinue: () {
                      value.nextStep();
                    },
                    onStepCancel: () {
                      value.resetStep();
                    },
                    steps: [
                      Step(
                        title: const Text("Add Image"),
                        content: Column(
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: value.path != null
                                  ? FileImage(File(value.path!))
                                  : null,
                            ),
                            IconButton(
                                onPressed: () async {
                                  ImagePicker imgPiker = ImagePicker();
                                  XFile? image = await imgPiker.pickImage(
                                      source: ImageSource.gallery);
                                  providerR!.updateImagePath(image!.path);
                                },
                                icon: const Icon(Icons.image))
                          ],
                        ),
                      ),
                      Step(
                        title: const Text("Add Name"),
                        content: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter number";
                            }
                            return null;
                          },
                          controller: txtName,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter Name"),
                          ),
                        ),
                      ),
                      Step(
                        title: const Text("Add Contact Number"),
                        content: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter number";
                            }
                            return null;
                          },
                          controller: txtContact,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter Number"),
                          ),
                        ),
                      ),
                      Step(
                        title: const Text("Add Email"),
                        content: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter number";
                            }
                            return null;
                          },
                          controller: txtEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter Email"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ContactModel cm = ContactModel(
                        name: txtName.text,
                        contact: txtContact.text,
                        email: txtEmail.text,
                        imagePath: providerW!.path);
                    providerR!.addContactData(cm);
                    Navigator.pop(context);
                    providerW!.resetStep();
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
