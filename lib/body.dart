import 'package:flutter/material.dart';
import 'package:healthchats/chatbotscreen.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/helper/helperFunction.dart';
import 'package:healthchats/profile.dart';
import 'package:healthchats/service/auth-service.dart';

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
      const SizedBox(
        height: 20,
      ),
      SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Expanded(
                child: IconButton(
                  alignment: Alignment.bottomLeft,
                  onPressed: () {
                    widget.scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\u{1F44B} Hello, $userName",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Expanded(
                child: IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    nextScreen(context, profilePage());
                  },
                  icon: const Icon(Icons.person),
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      // searchbar(),
      const SizedBox(height: 40),

      //chatroom widget
      InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const chatRoomScreen()),
            );
          },
          splashColor: kbackgroundColor2,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: kdefaultpadding * 2,
              vertical: kdefaultpadding / 2,
            ),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: ktilecolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kdefaultpadding,
                  ),
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "assets/pana1.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kdefaultpadding / 2,
                      vertical: kdefaultpadding,
                    ),
                    child: Text(
                      "Chat Rooms",
                      style: TextStyle(
                        color: kthemecolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      const SizedBox(
        height: 30,
      ),
      InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QueryChat()),
            );
          },
          splashColor: kbackgroundColor2,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: kdefaultpadding * 2,
              vertical: kdefaultpadding / 2,
            ),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: ktilecolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kdefaultpadding,
                  ),
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "assets/pana2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kdefaultpadding / 2,
                      vertical: kdefaultpadding,
                    ),
                    child: Text(
                      "AI powered Chatbot",
                      style: TextStyle(
                        color: kthemecolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
    ]);
  }
}
