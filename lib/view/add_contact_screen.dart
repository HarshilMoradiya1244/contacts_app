import 'package:contacts_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact App"),
        ),
        body: Consumer<ContactProvider>(
          builder: (context, value, child) => Theme(
            data: ThemeData(
              canvasColor: Colors.yellow,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.grey,
                    background: Colors.grey,
                    secondary: Colors.grey,
                  ),
            ),
            child: Stepper(
              currentStep: value.stepindex,
              onStepContinue: () {
                value.nextStep();
              },
              onStepCancel: () {
                value.cancelStep();
              },
              steps:  [
                const Step(title: Text("Add Image"), content: Text("Image")),
                const Step(
                    title: Text("Name Of Contact"),
                    content: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                const Step(
                    title: Text("Number Of Contact"),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                const Step(
                    title: Text("Email Of Contact"),
                    content: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                ),
                Step(title:const Text("data"), content:ElevatedButton(onPressed: (){}, child: const Text("Submit")) )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
