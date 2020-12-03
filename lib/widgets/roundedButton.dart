import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final Color btnColor, btnTextColor;
  final Function onPressed;
  final BuildContext context;
  final bool googleSignIn;

  RoundedButton(
      {@required this.btnText,
      @required this.btnColor,
      @required this.onPressed,
      @required this.context,
      this.btnTextColor,
      @required this.googleSignIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: onPressed,
        color: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              googleSignIn
                  ? Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image(
                        image: AssetImage('assets/images/google_logo.jpg'),
                        height: 26.0,
                      ),
                    )
                  : Container(),
              Text(
                btnText,
                style: TextStyle(
                  color: btnTextColor,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
