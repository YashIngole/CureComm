import 'package:flutter/material.dart';
import 'package:healthchats/body.dart';
import 'package:healthchats/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthchats/bottomnav.dart';
import 'package:healthchats/navigationbar.dart';
import 'package:healthchats/service/auth-service.dart';

import 'backgroundgradient.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: navbar(),
        bottomNavigationBar: bottomnav(),

        // appBar: BuildAppBar(),
        body: Stack(
          children: [
            BackgroundGradient(),
            Body(
              scaffoldKey: scaffoldKey,
            ),
          ],
        ),
        backgroundColor:
            Colors.transparent, // set background color to transparent
        resizeToAvoidBottomInset: false);
  }
}
