import 'package:flutter/material.dart';
import 'package:healthchats/body.dart';
import 'package:healthchats/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthchats/bottomnav.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomnav(),
        appBar: BuildAppBar(),
        body: Stack(
          children: [  
            BackgroundGradient(),
            Body(),
          ],
        ),
        backgroundColor:
            Colors.transparent, // set background color to transparent
        resizeToAvoidBottomInset: false);
  }

  // BuildAppBar method implementation
}

AppBar BuildAppBar() {
  return AppBar(
    toolbarHeight: 120, //distance of appbar from top to bottom
    backgroundColor: kbackgroundColor2,
    elevation: 0, // visibility of appbar line
    leading: IconButton(
      padding: EdgeInsets.only(left: 20), //distance between the icon button
      icon: Image.asset(
        "assets/fluent_navigation-unread-24-filled.png",
        color: Colors.black,
      ),
      onPressed: () {},
    ),
    actions: <Widget>[
      Container(
        child: IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: Transform.scale(
              scale: 1.2,
              child: Image.asset(
                "assets/Vector.png",
                color: Colors.black,
              ),
            )),
      )
    ],
    title: Column(
      crossAxisAlignment:
          CrossAxisAlignment.center, // alignment of the title text
      children: const [
        Text(
          "\u{1F44B} Hello", //hello at the appbar with shaking emoji
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          "    Username",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    ),
  );
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kbackgroundColor2,
            Color.fromARGB(255, 238, 236, 232)
          ], //range of gradient colors transitions
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
