import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/searchbar.dart';

import 'diseaseCard.dart';

class chatroomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor2,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: kbackgroundColor2,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Your Chat Rooms",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          iconSize: 80,
          icon: Image.asset(
            "assets/back.png",
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Wrap(children: <Widget>[
        Container(
          height: 250,
          padding: EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/amico.png",
            // alignment: Alignment.center,
            height: double.infinity,
            // width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: searchbar(),
        ),
        diseaseCard(),
      ]),
    );
  }
}
