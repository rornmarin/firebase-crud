import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/components/my_textfile.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection('items');
  final userNameController = TextEditingController();

  final positionController = TextEditingController();

  Future<void> addItem(String? name, String? position) {
    // Example item data
    Map<String, dynamic> itemData = {
      'name': name,
      'position': position,
    };

    return itemsCollection.add(itemData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
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
              controller: userNameController,
              hintText: "Name",
              obscursText: false),
          const SizedBox(
            height: 10,
          ),
          MytextFile(
              controller: userNameController,
              hintText: "Position",
              obscursText: false),
          // const Padding(
          //   padding: EdgeInsets.all(10),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: "Task Title",
          //       border: OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(10),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: "Task Description",
          //       border: OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.green.shade700,
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