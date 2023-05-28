import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthchats/chatbotscreen.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/helper/helperFunction.dart';
import 'package:healthchats/service/auth-service.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:html' as html;

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
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stories(
                    displayProgress: true,
                    storyItemList: [
                      // First group of stories
                      StoryItem(
                          name: "First Story",
                          thumbnail: AssetImage("assets/pana1.png"),
                          stories: [
                            // First story
                            Scaffold(
                              body: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/pana2.png"),
                                  ),
                                ),
                              ),
                            ),
                            // Second story in first group
                            Scaffold(
                              body: Center(
                                child: Text(
                                  "Second story in first group !",
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      // Second story group
                      StoryItem(
                        name: "2nd",
                        thumbnail: AssetImage("assets/pana2.png"),
                        stories: [
                          Scaffold(
                            body: Center(
                              child: Text(
                                "That's it, Folks !",
                                style: TextStyle(
                                  color: Color(0xff777777),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          CarouselSlider(
            items: [
              //1st Image of Slider
              GestureDetector(
                onTap: () {
                  nextScreen(context, chatRoomScreen());
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/chatroomcard.png"),
                    ),
                  ),
                ),
              ),

              //2nd Image of Slider
              GestureDetector(
                onTap: () {
                  nextScreen(context, QueryChat());
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/Aibot.png"),
                    ),
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              disableCenter: false,
              height: 250.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.60,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  html.window.open(
                      "https://m.timesofindia.com/videos/viral-videos/no-money-no-ambulance-bengal-man-travels-200-km-in-bus-with-sons-body-in-bag-video-goes-viral/videoshow/100323624.cms ",
                      "lol");
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/IconCard.png"),
                          fit: BoxFit.contain)),
                  height: 130,
                  width: 130,
                  child: Center(
                    child: Icon(Icons.newspaper),
                  ),
                ),
              ),
              SizedBox(width: 45),
              InkWell(
                onTap: () {
                  html.window.open(
                      "https://www.forbes.com/sites/bernardmarr/2022/12/06/the-top-5-healthcare-trends-in-2023/",
                      "trends");
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/IconCard.png"),
                          fit: BoxFit.contain)),
                  height: 130,
                  width: 130,
                  child: Center(
                    child: Icon(Icons.query_stats_outlined),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  html.window.open("https://www.medicalnewstoday.com/", "news");
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/IconCard.png"),
                          fit: BoxFit.contain)),
                  height: 130,
                  width: 130,
                  child: Center(
                    child: Icon(Icons.health_and_safety),
                  ),
                ),
              ),
              SizedBox(width: 45),
              InkWell(
                onTap: () {
                  html.window.open(
                      "https://www.happiesthealth.com/articles/integrated-medicine/backache-homeopathy",
                      "hot trends");
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/IconCard.png"),
                          fit: BoxFit.contain)),
                  height: 130,
                  width: 130,
                  child: Center(
                    child: Icon(Icons.library_books),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
