// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:healthchats/body.dart';
import 'package:healthchats/constants.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(),
      body: body(),
    );
  }

  AppBar BuildAppbar() {
    return AppBar(
      backgroundColor: kbackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
      ],
      title: const Text("Hello"),
    );
  }
}
