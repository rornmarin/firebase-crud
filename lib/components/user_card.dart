import 'package:firebase_test/edit_user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
  });

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
            children: [
              const Text(
                'Tutor Joes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Dev',
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
                    builder: (BuildContext context) => EditUser()),
              );
            },
            child: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          GestureDetector(
            onTap: () {
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
}
