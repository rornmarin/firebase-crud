import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/components/user_card.dart';
import 'package:firebase_test/screen/add_user.dart';
import 'package:firebase_test/screen/setting_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference items = FirebaseFirestore.instance.collection('items');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "CRUD APP",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade800,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SettingScreen();
                  },
                ));
              },
              child: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('items').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documnents = snapshot.data!.docs;
              return ListView(
                children: documnents
                    .map((doc) => Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: UserCard(
                            documentSnapshot: doc,
                            label: doc["name"],
                            des: doc['position'],
                          ),
                        ))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Container(
                height: 20,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text('Error'),
                ),
              );
            } else {
              return Center(
                child: Container(
                  height: 20,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: const Text('Loading..'),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade800,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AddUser()),
          );
          //
        },
        child: const Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
