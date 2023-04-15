// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthchats/textchatscreen.dart';

import 'constants.dart';

InkWell diseaseCard(BuildContext context, String diseaseName, int index) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => textchatscreen(diseases: diseases, index: index)),
      );
    },
    splashColor: kbackgroundColor2,
    child: Container(
      margin: const EdgeInsets.symmetric(
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
                color: const Color.fromARGB(255, 255, 207, 207),
                boxShadow: const [kdefaultshadow]),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: const Color.fromARGB(255, 255, 235, 224)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    diseaseName,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
          )
        ],
      ),
    ),
  );
}
