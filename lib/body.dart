import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //widget for searh bar
          padding: EdgeInsets.only(top: 10),
          child: Container(
            height: 62,
            width: 344, //figma dimensions
            margin: EdgeInsets.symmetric(horizontal: kdefaultpadding),
            // height: 54, //default dimension
            decoration: BoxDecoration(
                color: ksearchcolor,
                borderRadius: BorderRadius.circular(
                    20), //for circular border in search bar
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
                    hintStyle: TextStyle(color: Colors.black26),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(23.0),
                    prefixIcon: Icon(Icons.search),
                    iconColor: Colors.black,
                    suffixIcon: Icon(Icons.filter_list_sharp))),
          ),
        ),
        SizedBox(
            height:
                30), //adding tiles of chatbox and chatbot...have to replace with the widgets instead of containers
        Container(
          width: 350,
          height: 230,
          child: Image.asset("assets/tile1.png", fit: BoxFit.contain),
        ),
        SizedBox(height: 0),
        Container(
          width: 350,
          height: 230,
          child: Image.asset("assets/tile2.png", fit: BoxFit.contain),
        ),
      ],
    );
  }
}
