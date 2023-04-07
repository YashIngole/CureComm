import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:healthchats/service/auth-service.dart';
import 'navigationbar.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 200,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Full name:",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  userName,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email:",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
