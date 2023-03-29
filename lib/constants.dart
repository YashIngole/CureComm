import 'package:flutter/material.dart';

const Ktextcolor = Color.fromARGB(0, 198, 109, 108);
const kbackgroundColor = Color.fromARGB(216, 249, 185, 177);
const kdefaultpadding = 20.0;
const ksearchcolor = const Color(0xfff08080);
const kbackgroundColor2 = const Color(0xfffcc5ad);
const ktilecolor = const Color(0xffFBC4AB);
const kthemecolor = const Color(0xfff08080);
const kdefaultshadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Color.fromARGB(255, 240, 174, 174));

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

const kdefaultshadow2 = BoxShadow(
    color: Color.fromARGB(255, 255, 221, 170),
    offset: Offset(0, 25),
    blurRadius: 3,
    spreadRadius: -10);

const kdefaultgradient = LinearGradient(
    colors: [kbackgroundColor2, Color.fromARGB(255, 238, 236, 232)]);

final List<String> diseases = [
  "Cancer",
  "Diabetes",
  "Alzheimer's",
  "COVID-19",
  "Mental Health",
  "Typhoid",
  "Huntington's disease",
  "Kawasaki disease",
  "Sickle cell anemia",
  "Cystic fibrosis",
  "Polycystic kidney disease",
  "Lou Gehrig's disease (ALS)",
  "Tourette syndrome",
  "Wilson's disease",
  "Gaucher disease",
  "Narcolepsy",
  "Cushing's disease",
  "Ehlers-Danlos syndrome",
  "Guillain-Barré syndrome",
  "Lupus",
  "Muscular dystrophy",
  "Parkinson's disease",
  "Porphyria",
  "Prader-Willi syndrome",
  "Sjogren's syndrome",
  "Spinal muscular atrophy",
  "Turner syndrome",
  "Von Hippel-Lindau disease",
  "Wolfram syndrome",
  "Zellweger syndrome"
];

const kiconcolor = Color.fromARGB(255, 231, 173, 0);
