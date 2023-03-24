import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/searchbar.dart';
import 'package:healthchats/home.dart';

import 'diseaseCard.dart';

class chatroomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor2,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: kbackgroundColor2,
        elevation: 0,
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
      body: Column(children: [
        Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/amico.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.center),
            )),
        Container(
          alignment: Alignment.center,
          child: searchbar(),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: diseases.length,
              itemBuilder: (BuildContext context, int index) =>
                  diseaseCard(context, diseases[index])),
        ),
      ]),
    );
  }
}
