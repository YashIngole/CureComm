import 'package:flutter/material.dart';
import 'package:healthchats/textchatscreen.dart';

import 'constants.dart';

InkWell diseaseCard(BuildContext context, String diseaseName) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => textchatscreen()),
      );
    },
    splashColor: kbackgroundColor2,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: kdefaultpadding,
        vertical: kdefaultpadding,
      ),
      height: 160,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 200,
            width: 450,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Color.fromARGB(255, 255, 207, 207),
                boxShadow: [kdefaultshadow]),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color.fromARGB(255, 255, 235, 224)),
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
    ),
  );
}
