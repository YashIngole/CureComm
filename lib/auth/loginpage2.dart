import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/auth/registerPage.dart';
import 'package:healthchats/home.dart';
import 'package:healthchats/service/auth-service.dart';
import 'package:healthchats/service/database-service.dart';
import 'textInputdecoration.dart';
import 'package:healthchats/helper/helperFunction.dart';

import '../constants.dart';

class loginpage2 extends StatefulWidget {
  const loginpage2({super.key});

  @override
  State<loginpage2> createState() => _loginpage2State();
}

class _loginpage2State extends State<loginpage2> {
  final formkey = GlobalKey<FormState>();
  String email = "";
  String Password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(color: kthemecolor),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Join the conversation!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "And see what they are talking about",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          width: 300, child: Image.asset("assets/login.png")),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: kthemecolor,
                            )),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                            print(email);
                          });
                        },
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Please enter a valid email";
                        },
                      ),

                      // validator check

                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kthemecolor,
                            )),
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Password must be at least 6 characters";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            Password = val;
                            print(Password);
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kthemecolor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            login();
                          },
                          child: Text("Sign in",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Register here",
                                style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, registerPage());
                                  })
                          ]))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  login() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithEmailAndPassword(email, Password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await databaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);

          //saving the values to our shared preferences

          await helperFunctions.saveUserLoggedInStatus(true);
          await helperFunctions.saveUserEmailSF(email);
          await helperFunctions.saveUsernameSF(snapshot.docs[0]['fullName']);

          nextScreenReplace(context, Home());
        } else {
          showSnackbar(
            context,
            Colors.red,
            value,
          );
          _isLoading = false;
        }
      });
    }
  }
}
