import 'package:flutter/material.dart';

import 'constants.dart';

Container searchbar() {
  return Container(
    //widget for searh bar
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      // height: 62,
      // width: 344, //figma dimensions
      margin: const EdgeInsets.symmetric(horizontal: kdefaultpadding),
      height: 54, //default dimension
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius:
            BorderRadius.circular(20), //for circular border in search bar
      ),
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
  );
}
