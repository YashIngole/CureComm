// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:healthchats/auth/loginpage2.dart';
import 'package:healthchats/constants.dart';

// ignore: camel_case_types
class logInPage extends StatefulWidget {
  const logInPage({super.key});

  @override
  State<logInPage> createState() => _logInPageState();
}

class _logInPageState extends State<logInPage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/pana7.png"),
                  const SizedBox(
                    height: 70,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kdefaultpadding * 1.2),
                    child: Column(
                      children: [
                        Text(
                            "Connect, Cure, and Catalyze: Empowering Health Journeys.",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            "Transforming lives by fostering a supportive community, providing personalized health chats, leveraging AI expertise, building resilience, and promoting holistic well-being on the health journey.",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, loginpage2());
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
                          "Get started",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
