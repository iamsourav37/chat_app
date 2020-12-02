import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signin",
          style: TextStyle(
            fontSize: 30.0,
            letterSpacing: 1.8,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 21.0,
                ),
                decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'email',
                  prefixIcon: Icon(
                    Icons.email,
                    size: 25.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21.0,
                ),
                decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'password',
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    size: 25.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    print("forget password...");
                  },
                  child: Text("Forget password?"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
