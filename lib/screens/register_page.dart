import 'package:e_commerce/widgets/custom_btn.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //build alert for errors
  Future<void> _alertDialogBuilder() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text("Just some random text for now"),
          ),
          actions: [
            FlatButton(
              child: Text("Close dialog"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(          
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //header title
              Container(
                padding: EdgeInsets.only(top:24),
                child: Text("Create a new account", textAlign: TextAlign.center, style: Constants.boldHeading,)
              ),

              //Input fields
              Column(
                children: [
                  CustomInput(hintext: "Email...",),
                  CustomInput(hintext: "Password...",),
                  CustomBtn(
                    text: "Create new account",
                    onPressed: () {
                      _alertDialogBuilder();
                    },
                    outlineBtn: false,
                  )
                ],
              ),
              
              //register button
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomBtn(
                  text: "Back to Login",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  outlineBtn: true,
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}