import 'package:chat_app/helper/authentication.dart';
import 'package:chat_app/screens/signin.dart';
import 'package:chat_app/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Authentication authentication = Authentication();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    authentication.checkAuthentication(context);
    super.initState();
  }

  void onFormSubmit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      String username = usernameController.text.trim();
      String email = emailController.text.trim();
      String pass = passwordController.text;

      await authentication.signUpUserWithEmailAndPassword(
          context, username, email, pass);
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
          "Signup",
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
                      validator: (String value) {
                        return value.isEmpty || value.length < 3
                            ? "Provide username atleast 3 character"
                            : null;
                      },
                      controller: usernameController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21.0,
                      ),
                      decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'username',
                        errorStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)
                            ? null
                            : "Enter correct email";
                      },
                      controller: emailController,
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
                      validator: (String value) {
                        return value.trim().length < 6
                            ? 'Enter atleast 6 character'
                            : null;
                      },
                      controller: passwordController,
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
                      btnText: "Signup",
                      context: context,
                      googleSignIn: false,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                          print("Navigate to signin screen");
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
      ),
    );
  }
}
