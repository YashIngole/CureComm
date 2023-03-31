import 'package:flutter/material.dart';
import 'package:healthchats/backgroundgradient.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/searchbar.dart';
import 'package:healthchats/home.dart';

import 'diseaseCard.dart';

class chatroomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: Image.asset(
              "assets/amico.png",
            ),
          ),
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
                    diseaseCard(context, diseases[index], index)),
          ),
        ]),
      ]),
    );
  }
}
