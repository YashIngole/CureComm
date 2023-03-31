import 'package:flutter/material.dart';
import 'package:healthchats/chatbotscreen.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/helper/helperFunction.dart';
import 'package:healthchats/navigationbar.dart';
import 'package:healthchats/service/auth-service.dart';
import 'home.dart';
import 'package:healthchats/searchbar.dart';

class Body extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const Body({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await helperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await helperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      SafeArea(
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Expanded(
                    child: IconButton(
                  alignment: Alignment.bottomLeft,
                  onPressed: () {
                    widget.scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                )),
              ),
              Expanded(
                  child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\u{1F44B} Hello \n $userName", //hello at the appbar with shaking emoji
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              )),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Expanded(
                    child: IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  iconSize: 30,
                )),
              )
            ]),
      ),
      SizedBox(
        height: 20,
      ),
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
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => chatbotscreen()),
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
      ),
    ]);
  }
}
