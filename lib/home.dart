import 'package:flutter/material.dart';
import 'package:healthchats/body.dart';
import 'package:healthchats/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: Stack(
        children: [
          BackgroundGradient(),
          // body(),
        ],
      ),
      backgroundColor:
          Colors.transparent, // set background color to transparent
    );
  }

  // BuildAppBar method implementation
}

AppBar BuildAppBar() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 237, 188, 160),
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/fluent_navigation-unread-24-filled.svg",
        color: Colors.black,
      ),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: Transform.scale(
            scale: 1.7,
            child: SvgPicture.asset(
              "assets/Vector.svg",
              color: Colors.black,
            ),
          ))
    ],
  );
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 237, 188, 160),
            Color.fromARGB(255, 238, 236, 232)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
