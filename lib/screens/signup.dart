import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signup",
          style: TextStyle(
            fontSize: 30.0,
            letterSpacing: 1.8,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                    decoration: kTextFieldInputDecoration.copyWith(
                      hintText: 'username',
                      prefixIcon: Icon(
                        Icons.person,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
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
                    obscureText: true,
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
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: RoundedButton(
                    onPressed: () {},
                    btnColor: Colors.redAccent,
                    btnText: "Signup",
                    context: context,
                    googleSignIn: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: RoundedButton(
                    onPressed: () {},
                    btnText: "Signup with Google",
                    btnColor: Colors.white,
                    context: context,
                    btnTextColor: Colors.black,
                    googleSignIn: true,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account ? ",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Navigate to signup screen");
                      },
                      child: Text(
                        "Signin",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
