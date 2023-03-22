import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //widget for searh bar
        padding: EdgeInsets.only(top: 10),
        child: Container(
          // height: 62,
          // width: 344, //figma dimensions
          margin: EdgeInsets.symmetric(horizontal: kdefaultpadding),
          height: 54, //default dimension
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius:
                  BorderRadius.circular(20), //for circular border in search bar
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: ksearchcolor.withOpacity(0.5),
                )
              ]),
          child: const TextField(
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 17),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15.0),
                  prefixIcon: Icon(Icons.search),
                  iconColor: Colors.black,
                  suffixIcon: Icon(Icons.filter_list_sharp))),
        ),
      ),
      // Container(
      //   padding: EdgeInsets.all(kdefaultpadding),
      //   child: Image.asset("assets/tile1.png"),
      // ),
      // Container(
      //   padding: EdgeInsets.all(kdefaultpadding),
      //   child: Image.asset("assets/tile2.png"),
      //
      SizedBox(height: 20),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: kdefaultpadding, vertical: kdefaultpadding - 20),
        // color: kbackgroundColor2,
        height: 200,
        width: 480,
        child: Image.asset("assets/tile1.png"),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: kdefaultpadding, vertical: kdefaultpadding - 20),
        // color: kbackgroundColor2,
        height: 200,
        width: 480,

        child: Image.asset("assets/tile2.png"),
      )
    ]);
  }
}
