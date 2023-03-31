import 'package:flutter/material.dart';
import 'package:healthchats/backgroundgradient.dart';
import 'package:healthchats/constants.dart';

import 'home.dart';

class chatbotscreen extends StatelessWidget {
  @override
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
