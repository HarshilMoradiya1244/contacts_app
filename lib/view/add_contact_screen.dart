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

   GlobalKey<FormState>namekey = GlobalKey<FormState>();
   GlobalKey<FormState>contactkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Contacts",
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
                      if(providerW!.stepindex == 1){
                        if(namekey.currentState!.validate()){
                          providerW!.nextStep();
                        }
                      }
                      else if(providerW!.stepindex == 2){
                        if(contactkey.currentState!.validate()){
                          providerW!.nextStep();
                        }

                      }
                      else{
                        providerW!.nextStep();
                      }
                    },
                    onStepCancel: () {
                      value.resetStep();
                    },
                    steps: [
                      Step(
                        title: const Text("Image"),
                        content: Column(
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey,
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
                        title: const Text(" Name"),
                        content: Form(
                          key: namekey,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter name";
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
                      ),
                      Step(
                        title: const Text("Contact Number"),
                        content: Form(
                          key: contactkey,
                          child: TextFormField(
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
                      ),
                      Step(
                        title: const Text("Email"),
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
                    providerR!.updateImagePath(null);
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
