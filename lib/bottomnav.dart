import 'constants.dart';
import 'package:flutter/material.dart';

Container bottomnav() {
  return Container(
    padding: const EdgeInsets.only(
        left: kdefaultpadding * 2,
        right: kdefaultpadding *
            2, //padding onky from tleft right and bottom for the bottom navigation bar
        bottom: kdefaultpadding),
    height: 50,
    decoration: const BoxDecoration(
      color: Colors.white,

      // boxShadow: [
      //   BoxShadow(
      //       offset: Offset(0, -10), blurRadius: 35, color: kbackgroundColor2)
      // ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //widget array for icon buttons at bottom of the navigation bar
        Transform.scale(
            scale: 1,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.home))),
        Transform.scale(
            scale: 1,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))),
        Transform.scale(
            scale: 1,
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))),
      ],
    ),
  );
}
