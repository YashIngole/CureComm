import 'package:flutter/material.dart';

import 'constants.dart';

Container diseaseCard() {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: kdefaultpadding,
      vertical: kdefaultpadding,
    ),
    // color: Colors.amber,
    height: 160,
    child: Stack(
      children: <Widget>[
        Container(
          height: 136,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.redAccent,
              boxShadow: [kdefaultshadow]),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: ktilecolor),
          ),
        )
      ],
    ),
  );
}
