import 'package:flutter/material.dart';
import 'package:healthchats/auth/loginpage2.dart';
import 'package:healthchats/constants.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset("assets/pana7.png"),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kdefaultpadding * 1.2),
                    child: Text(
                        "HealthChats allows people with similar health conditions to connect with each other virtualy and share their experiences",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kthemecolor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        nextScreen(context, loginpage2());
                      },
                      child: Text("Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
