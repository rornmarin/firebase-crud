// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_test/screen/edit_user.dart';

class UserCard extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  final String? label;
  final String? des;
  const UserCard({
    Key? key,
    required this.documentSnapshot,
    this.label,
    this.des,
  }) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.person),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.label}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.des}",
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          ),
          const SizedBox(
            width: 110,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      EditUser(documentSnapshot: widget.documentSnapshot),
                ),
              );
            },
            child: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          GestureDetector(
            onTap: () async {
              await itemDelete(widget.documentSnapshot.id);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Data Deleted")));
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  itemDelete(id) async {
    FirebaseFirestore.instance.collection('items').doc(id).delete();
  }
}
