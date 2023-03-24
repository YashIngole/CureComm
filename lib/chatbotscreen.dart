import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';

class chatbotscreen extends StatelessWidget {
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
            "Your Chat Bot",
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
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/cuate.png"),
              fit: BoxFit.contain,
              alignment: Alignment.center,
            )),
            height: 250,
            width: 450,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Colors.white),
          ))
        ]));
  }
}
