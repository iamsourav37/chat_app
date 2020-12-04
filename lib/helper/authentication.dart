import 'package:chat_app/screens/chat_home.dart';
import 'package:chat_app/screens/signin.dart';
import 'package:chat_app/widgets/showAlerDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User getCurrentUser() {
    User user = _auth.currentUser;
    if (user == null) {
      return null;
    } else {
      return user;
    }
  }

  checkAuthentication(BuildContext context) {
    _auth.authStateChanges().listen(
      (User user) {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatHome(),
            ),
          );
        } else {
          print('User is null');
        }
      },
    );
  }

  Future<void> signUpUserWithEmailAndPassword(BuildContext context,
      String username, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("user is created");

      _auth.currentUser.updateProfile(displayName: username);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChatHome(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMyDialog(context, "Weak Password", e.toString());
      } else if (e.code == 'email-already-in-use') {
        showMyDialog(context, "Existing Email", e.toString());
      }
    } catch (e) {
      showMyDialog(context, "Something Wrong", e.toString());
    }
  }

  Future<void> signInUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChatHome(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMyDialog(context, "User Not Found", e.toString());
      } else if (e.code == 'wrong-password') {
        showMyDialog(context, "Wrong Password", e.toString());
      } else {
        showMyDialog(context, "Something Wrong", e.toString());
      }
    }
  }

  Future<void> signUpWithGoogleAccount() async {}

  Future<void> signOutUser(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignIn(),
      ),
    );
  }
}
