// ignore_for_file: override_on_non_overriding_member, annotate_overrides, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthchats/body.dart';
import 'package:healthchats/constants.dart';

import 'package:healthchats/navigationbar.dart';
import 'package:healthchats/service/auth-service.dart';
import 'helper/helperFunction.dart';

import 'backgroundgradient.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
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
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: navbar(context, userName, email),
        // bottomNavigationBar: bottomnav(),

        // appBar: BuildAppBar(),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [kbackgroundColor2, Color.fromARGB(255, 238, 236, 232)],
          )),
          child: Body(
            scaffoldKey: scaffoldKey,
          ),
        ),
        backgroundColor:
            Colors.transparent, // set background color to transparent
        resizeToAvoidBottomInset: false);
  }
}
