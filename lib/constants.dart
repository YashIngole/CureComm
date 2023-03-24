import 'package:flutter/material.dart';

const Ktextcolor = Color.fromARGB(0, 198, 109, 108);
const kbackgroundColor = Color.fromARGB(216, 249, 185, 177);
const kdefaultpadding = 20.0;
const ksearchcolor = const Color(0xfff08080);
const kbackgroundColor2 = const Color(0xfffcc5ad);
const ktilecolor = const Color(0xffFBC4AB);
const kdefaultshadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Color.fromARGB(255, 240, 174, 174));

const kdefaultshadow2 = BoxShadow(
    color: Color.fromARGB(255, 255, 221, 170),
    offset: Offset(0, 25),
    blurRadius: 3,
    spreadRadius: -10);

const kdefaultgradient = LinearGradient(
    colors: [kbackgroundColor2, Color.fromARGB(255, 238, 236, 232)]);

final List<String> diseases = [
  "abc",
  "lol",
  "Cancer",
  "Diabetes",
  "Alzheimer's",
  "COVID-19",
  "Mental Health",
  "Typhoid"
];
