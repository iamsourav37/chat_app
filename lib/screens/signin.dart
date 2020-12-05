import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/authentication.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:chat_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Authentication authentication = Authentication();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void onFormSubmit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      String email = emailController.text.trim();
      String password = passwordController.text;
      await authentication.signInUserWithEmailAndPassword(
          context, email, password);
      setState(() {
        isLoading = false;
      });
    }
  }

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
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 60,
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)
                            ? null
                            : "Enter correct email";
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 21.0,
                      ),
                      decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'email',
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (String value) {
                        return value.trim().length < 6
                            ? 'Enter atleast 6 character'
                            : null;
                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21.0,
                      ),
                      decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'password',
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                    child: RoundedButton(
                      onPressed: () {
                        this.onFormSubmit();
                      },
                      btnColor: Colors.redAccent,
                      btnText: "Signin",
                      context: context,
                      googleSignIn: false,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
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
      ),
    );
  }
}
