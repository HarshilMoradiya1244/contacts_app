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
          title: const Text("Add Contact"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Theme(
                data: ThemeData(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.grey,
                        background: Colors.grey,
                        secondary: Colors.green,
                      ),
                ),
                child: Stepper(
                  currentStep: providerW!.stepindex,
                  onStepContinue: () {
                    providerW!.nextStep();
                  },
                  onStepCancel: () {
                    providerW!.cancelStep();
                  },
                  steps: [
                    Step(
                      title: const Text("Image"),
                      content: InkWell(
                        onTap: () {
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
                                        providerR!.updateImagePath(image!.path);
                                      },
                                      child: const Text("Choose Photo")),
                                  TextButton(
                                      onPressed: () async {
                                        ImagePicker picker = ImagePicker();
                                        XFile? image = await picker.pickImage(
                                            source: ImageSource.camera);
                                        providerR!.updateImagePath(image!.path);
                                      },
                                      child: const Text("Take Photo")),
                                ],
                              );
                            },
                          );
                        },
                        child: Consumer<ContactProvider>(
                          builder: (context, value, child) => CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: value.path != null
                                ? FileImage(File(value.path!))
                                : null,
                            radius: 60,
                          ),
                        ),
                      ),
                    ),
                    Step(
                        title: const Text("Name of Contact"),
                        content: TextField(
                          controller: txtName,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.name,
                        )),
                    Step(
                      title: const Text("Contact Number"),
                      content: TextField(
                        controller: txtContact,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Step(
                        title: const Text("Contact Email"),
                        content: TextField(
                          controller: txtEmail,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        )),
                  ],
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
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
