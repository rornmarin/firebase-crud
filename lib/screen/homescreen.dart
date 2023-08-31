import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/screen/add_user.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference items = FirebaseFirestore.instance.collection('items');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CRUD APP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documnents = snapshot.data!.docs;
            return ListView(
              children: documnents
                  .map(
                    (doc) => Card(
                      child: ListTile(
                        title: Text(doc['name']),
                        subtitle: Text(doc['postion']),
                        // trailing: const Text('username'),
                      ),
                    ),
                  )
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
        // : const Column(
        //   children: [
        //     UserCard(),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
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
