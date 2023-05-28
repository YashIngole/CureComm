// ignore_for_file: override_on_non_overriding_member, annotate_overrides, prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/body.dart';
import 'package:healthchats/chatbotscreen.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/constants.dart';
// import 'package:healthchats/constants.dart';

import 'package:healthchats/navigationbar.dart';
import 'package:healthchats/profile.dart';
import 'package:healthchats/service/auth-service.dart';
import 'helper/helperFunction.dart';
import 'clipper.dart';
// import 'package:carousel_slider/carousel_slider.dart';

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
    int index = 0;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/logo.png",
              height: 70,
            ),
          ),
          toolbarHeight: 50,
          backgroundColor: Color(0xffebedf3),
          // title: Text(
          //   "\u{1F44B} Hello, $userName",
          //   style: const TextStyle(
          //     fontSize: 20,
          //     color: Colors.black,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          foregroundColor: Colors.black,
        ),
        key: scaffoldKey,
        endDrawer: navbar(context, userName, email),
        body: Stack(children: [
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Color(0xffebedf3)),
              child: Body(
                scaffoldKey: scaffoldKey,
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: 60,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 9, 8, 8)
                                .withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: BottomNavigationBar(
                      onTap: (value) {
                        if (value == 0) {
                          nextScreen(context, profilePage());
                        }
                      },
                      currentIndex: 1,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'profile',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.people),
                          label: 'Friends   ',
                        ),
                      ],
                    ),
                  )),
            ),
          )
        ]),
        backgroundColor:
            Colors.transparent, // set background color to transparent
        resizeToAvoidBottomInset: false);
  }
}
