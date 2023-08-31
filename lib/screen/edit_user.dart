// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/screen/homescreen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_test/components/my_textfile.dart';

class EditUser extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  //  final List<DocumentSnapshot> documnents = snapshot.data!.docs;

  EditUser({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  final userNameController = TextEditingController();
  final positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          "Edit User",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MytextFile(
              onchanged: (p0) {
                debugPrint("-------->Update Name: $p0");
              },
              // initail: '${doc.name}',
              // controller: userNameController,
              hintText: "Name",
              obscursText: false),
          const SizedBox(
            height: 10,
          ),
          MytextFile(
              onchanged: (p0) {
                debugPrint("-------->Update Position: $p0");
              },
              controller: positionController,
              hintText: "Position",
              obscursText: false),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 240),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      fireupdate();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ));
                    },
                    child: GestureDetector(
                      onTap: () async {
                        await fireupdate();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future fireupdate() async {
    final usercolloction = FirebaseFirestore.instance.collection("items");
    final docRef = usercolloction.doc(documentSnapshot.id);
    try {
      await docRef.update({
        "name": userNameController.text,
        "position": positionController.text
      });
    } catch (e) {
      debugPrint("-------erorrr> $e");
    }
  }
}
