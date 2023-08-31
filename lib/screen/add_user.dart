import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/components/my_textfile.dart';
import 'package:firebase_test/controller/data.dart';
import 'package:firebase_test/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController positioncontroller = TextEditingController();
  final data = Get.put(DataController());
  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection('items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          "Add User",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MytextFile(
              onchanged: (p0) {
                debugPrint("------> Name: $p0");
              },
              controller: userNameController,
              hintText: "Name",
              obscursText: false),
          const SizedBox(
            height: 10,
          ),
          MytextFile(
              onchanged: (p0) {
                debugPrint("------> Position: $p0");
              },
              controller: positioncontroller,
              hintText: "Position",
              obscursText: false),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Map<String, dynamic> itemData = {
                      'name': userNameController.text,
                      'position': positioncontroller.text,
                    };
                    var collection =
                        FirebaseFirestore.instance.collection('items');
                    collection
                        .add(itemData)
                        .then((_) => {
                              debugPrint('-------->> Added: $itemData'),
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ))
                            })
                        .catchError((error) => {
                              debugPrint('---------->>Add failed: $error'),
                            });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        "Clear",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
