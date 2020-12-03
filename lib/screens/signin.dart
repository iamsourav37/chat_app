import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: RoundedButton(
                    onPressed: () {},
                    btnColor: Colors.redAccent,
                    btnText: "Signin",
                    context: context,
                    googleSignIn: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: RoundedButton(
                    onPressed: () {},
                    btnText: "Signin with Google",
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
                      "Dont have an account ? ",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Navigate to signup screen");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "Register now",
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
