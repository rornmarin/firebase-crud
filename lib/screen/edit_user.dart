import 'package:firebase_test/components/my_textfile.dart';
import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  EditUser({super.key});

  final userNameController = TextEditingController();
  final positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text(
          "Edit User",
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
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
}
