// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/service/auth-service.dart';
import 'helper/helperFunction.dart';

class profilePage extends StatefulWidget {
  profilePage({super.key});
  AuthService authService = AuthService();

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String userName = "";
  String email = "";

  @override
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kthemecolor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 200,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Full name:",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  userName,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email:",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
