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
    if (!authentication.checkAuthentication()) {
      // user is sign out
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
      );
    }
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
      body: Container(
        child: Text(user.email),
      ),
    );
  }
}
