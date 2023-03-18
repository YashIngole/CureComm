import 'constants.dart';
import 'package:flutter/material.dart';
import 'home.dart';

Container bottomnav() {
  return Container(
    padding: EdgeInsets.only(
        left: kdefaultpadding * 2,
        right: kdefaultpadding * 2,
        bottom: kdefaultpadding),
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,

      // boxShadow: [
      //   BoxShadow(
      //       offset: Offset(0, -10), blurRadius: 35, color: kbackgroundColor2)
      // ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Transform.scale(
            scale: 1,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.home))),
        Transform.scale(
            scale: 1,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite))),
        Transform.scale(
            scale: 1,
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications))),
      ],
    ),
  );
}
