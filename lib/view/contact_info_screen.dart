import 'package:flutter/material.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact Info",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back_outlined,color: Colors.white,),),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.30,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.black),
              child: Align(
                  alignment:Alignment.bottomLeft,child: Text("Harshil Moradiya",style: TextStyle(fontSize: 20,color: Colors.white),)),
            ),
            Divider(
              color: Colors.grey.shade500,
              thickness: 1,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.56,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.black),
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
                              "+91 1234567890",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                                  "ABC@gmail.com",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
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
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "Indiaß",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
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
                                  onPressed: () {},
                                  icon: Icon(Icons.call),
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
                                  onPressed: () {},
                                  icon: Icon(Icons.message),
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
    );
  }
}
