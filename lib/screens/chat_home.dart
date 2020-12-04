import 'package:chat_app/helper/authentication.dart';
import 'package:chat_app/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  Authentication authentication = Authentication();
  User user;

  @override
  void initState() {
    user = authentication.getCurrentUser();
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
      );
    }
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
        title: Text(user.displayName),
      ),
    );
  }
}
