import 'package:contacts_app/model/contact_model.dart';
import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
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
    providerW = context.read<ContactProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact App"),
        ),
        body: SingleChildScrollView(
          child: Consumer<ContactProvider>(
            builder: (context, value, child) => Theme(
              data: ThemeData(
                canvasColor: Colors.yellow,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: Colors.grey,
                      background: Colors.grey,
                      secondary: Colors.grey,
                    ),
              ),
              child: Column(
                children: [
                  Stepper(
                    currentStep: value.stepindex,
                    onStepContinue: () {
                      value.nextStep();
                    },
                    onStepCancel: () {
                      value.cancelStep();
                    },
                    steps: [
                      const Step(title: Text("Add Image"), content: Text("Image")),
                       Step(
                          title: Text("Name Of Contact"),
                          content: TextField(
                            controller: txtName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(border: OutlineInputBorder()),
                          )),
                       Step(
                          title: Text("Number Of Contact"),
                          content: TextField(
                            controller: txtContact,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: OutlineInputBorder()),
                          )),
                       Step(
                        title: Text("Email Of Contact"),
                        content: TextField(
                          controller: txtEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(onPressed: (){
                    ContactModel cm = ContactModel(
                      name: txtName.text,
                      contact: txtContact.text,
                      email: txtEmail.text,
                    );
                    Navigator.pop(context);
                  }, child: Text("Submit"),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
