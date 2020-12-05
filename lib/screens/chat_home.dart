import 'package:chat_app/helper/authentication.dart';
import 'package:chat_app/helper/databaseHelper.dart';
import 'package:chat_app/screens/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  Authentication authentication = Authentication();
  DatabaseHelper databaseHelper = DatabaseHelper();
  User user;

  @override
  void initState() {
    user = authentication.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              authentication.signOutUser(context);
            },
          ),
        ],
        title: Text("Chat Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.search,
          color: Colors.black,
          size: 26.7,
        ),
      ),
      body: Container(
        child: Text(user.email),
      ),
    );
  }
}
