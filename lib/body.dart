import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 25),
          child: Container(
            height: 62,
            width: 344, //figma dimensions
            margin: EdgeInsets.symmetric(horizontal: kdefaultpadding),
            // height: 54,
            decoration: BoxDecoration(
                color: ksearchcolor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: ksearchcolor.withOpacity(0.5),
                  )
                ]),
            child: TextField(
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black26),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(23.0),
                    prefixIcon: Icon(Icons.search),
                    iconColor: Colors.black,
                    suffixIcon: Icon(Icons.filter_list_sharp))),
          ),
        ),
        SizedBox(height: 40),
        Container(
          width: 350,
          height: 220,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/tile1.png"), fit: BoxFit.contain)),
        ),
        Container(
          width: 350,
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/tile2.png"), fit: BoxFit.contain),
          ),
        )
      ],
    );
  }
}
