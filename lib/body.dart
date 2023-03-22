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
      //widget for tiles
      SizedBox(height: 20),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: kdefaultpadding,
          vertical: kdefaultpadding,
        ),
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [kdefaultshadow],
          color: ktilecolor,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kdefaultpadding,
                ),
                height: 160,
                width: 200,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "assets/pana1.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: kdefaultpadding,
              bottom: kdefaultpadding,
              top: kdefaultpadding + 35,
              right: kdefaultpadding,
              child: Text(
                "Chat Rooms",
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 104, 104),
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        margin: EdgeInsets.symmetric(
          horizontal: kdefaultpadding,
          vertical: kdefaultpadding,
        ),
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [kdefaultshadow],
          color: ktilecolor,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kdefaultpadding,
                ),
                height: 160,
                width: 200,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "assets/pana2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: kdefaultpadding,
              bottom: kdefaultpadding,
              top: kdefaultpadding + 20,
              right: kdefaultpadding,
              child: Text(
                "AI powered \n Chat Bot",
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 104, 104),
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
