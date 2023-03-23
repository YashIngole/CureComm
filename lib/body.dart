import 'package:flutter/material.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/searchbar.dart';

class Body extends StatefulWidget {
  const Body({Key? key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      searchbar(),
      //widget for tiles
      SizedBox(height: 20),

      //chatroom widget
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => chatroomScreen()),
          );
        },
        splashColor: kbackgroundColor2,
        child: Container(
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
      ),
// chatbot tile
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
