import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';
import '../utils/color_list.dart';

class HiddenScreen extends StatefulWidget {
  const HiddenScreen({super.key});

  @override
  State<HiddenScreen> createState() => _HiddenScreenState();
}

class _HiddenScreenState extends State<HiddenScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hide Screen "),
        ),
        body: ListView.builder(
          itemCount: providerW!.hideContactList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){
                  providerR!.storeIndex(index);
                  providerR!.isLock = true;
                  Navigator.pushNamed(context, 'contactInfo',arguments: providerR!.hideContactList[index]);
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
                      children: [providerW!.hideContactList[index].imagePath != null  ? CircleAvatar(
                        radius: 25,
                        backgroundImage: FileImage(File("${providerW!.hideContactList[index].imagePath}")),
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
                            "${providerW!.hideContactList[index].name!.isNotEmpty ? providerW!.hideContactList[index].name!.substring(0, 1).toUpperCase() : 0}",
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
                            Text("${providerR!.hideContactList[index].name}"),
                            Text("${providerR!.hideContactList[index].contact}"),
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
      ),
    );
  }
}
