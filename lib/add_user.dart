import 'package:firebase_test/components/my_textfile.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  final userNameController = TextEditingController();
  final positionController = TextEditingController();

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
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green.shade700,
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: () async {},
                  child: const Text("Add"),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 15)),
                  onPressed: () async {},
                  child: const Text("Clear"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
