import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Landingpage extends StatelessWidget {
  //init Firebase instance
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //StreamBuilder can check the login state live
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                //if snapshot has an error
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ),
                  );
                }

                //Connection state active - Do the user login check inside the if statement
                if (streamSnapshot.connectionState == ConnectionState.active) {
                  //get user
                  User _user = streamSnapshot.data;

                  //if user is null, we aren't logged in...
                  if(_user == null){
                    return LoginPage();
                  }else{
                    return HomePage();
                  }

                }

                //check the auth state - Loading...
                return Scaffold(
                  body: Container(
                      child: Center(
                    child: Text("Checking auth...",
                        style: Constants.regularHeading),
                  )),
                );
              });
        }

        return Scaffold(
          body: Container(
              child: Center(
            child: Text("Initializing...", style: Constants.regularHeading),
          )),
        );
      },
    );
  }
}
