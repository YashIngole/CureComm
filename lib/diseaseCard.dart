import 'package:flutter/material.dart';

import 'constants.dart';

Container diseaseCard(String diseaseName) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: kdefaultpadding,
      vertical: kdefaultpadding,
    ),
    height: 160,
    child: Stack(
      children: <Widget>[
        Container(
          height: 136,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color.fromARGB(255, 226, 111, 111),
              boxShadow: [kdefaultshadow]),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Color.fromARGB(255, 238, 196, 174)),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  diseaseName,
                  style: TextStyle(fontSize: 20),
                )),
          ),
        )
      ],
    ),
  );
}
