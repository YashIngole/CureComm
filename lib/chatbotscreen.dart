import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/backgroundgradient.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/service/database-service.dart';
import 'service/auth-service.dart';
import 'helper/helperFunction.dart';
import 'home.dart';

class chatbotscreen extends StatefulWidget {
  @override
  State<chatbotscreen> createState() => _chatbotscreenState();
}

class _chatbotscreenState extends State<chatbotscreen> {
  @override
  String userName = "";
  String email = "";
  Stream? groups;
  AuthService authService = AuthService();
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await helperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await helperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    //getting the list of snapshots in our database
    await databaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor2,
        body: Stack(children: [
          BackgroundGradient(),
          Column(children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(kdefaultpadding),
                    onPressed: () {
                      nextScreen(context, Home());
                    },
                    icon: Icon(Icons.keyboard_backspace),
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/cuate.png"),
                fit: BoxFit.contain,
                alignment: Alignment.center,
              )),
              height: 300,
              width: 450,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ))
          ]),
        ]));
  }
}
