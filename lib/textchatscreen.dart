// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'constants.dart';
import 'chatroomScreen.dart';

class textchatscreen extends StatelessWidget {
  final List<String> diseases;
  final int index;

  const textchatscreen(
      {super.key, required this.diseases, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: kbackgroundColor2,
          elevation: 0,
          centerTitle: true,
          title: Text(
            diseases[index],
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            iconSize: 80,
            icon: Image.asset(
              "assets/back.png",
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_sharp,
                  size: 35,
                ))
          ]),
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kdefaultpadding, vertical: kdefaultpadding / 2),
            decoration: const BoxDecoration(color: Colors.white),
            child: SafeArea(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: kiconcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(children: const [
                      SizedBox(
                        width: kdefaultpadding,
                      ),
                      Icon(
                        Icons.add_a_photo_outlined,
                        color: kiconcolor,
                      ),
                      SizedBox(
                        width: kdefaultpadding,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none),
                      )),
                      Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: kiconcolor,
                      ),
                      SizedBox(
                        width: kdefaultpadding * 0.75,
                      )
                    ]),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
