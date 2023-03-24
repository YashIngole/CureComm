import 'package:flutter/material.dart';
import 'constants.dart';
import 'chatroomScreen.dart';

class textchatscreen extends StatelessWidget {
  final List<String> diseases;
  final int index;

  textchatscreen({required this.diseases, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: kbackgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          diseases[index],
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
    );
  }
}
