// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          ? const Center(
              child: CircularProgressIndicator(color: kthemecolor),
            )
          : SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/light-1.png"))),
                            ),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/light-2.png"))),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      labelText: "Email",
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.blue,
                                      ),
                                    ),
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
                                ),
                                Container(
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: textInputDecoration.copyWith(
                                        labelText: "Password",
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Colors.blue,
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              login();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text.rich(TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " Sign up",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        nextScreen(
                                            context, const registerPage());
                                      })
                              ]))
                        ],
                      ),
                    ),

                    // validator check
                  ],
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

          nextScreenReplace(context, const Home());
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
