// ignore_for_file: constant_identifier_names, unnecessary_const

import 'package:flutter/material.dart';

const Ktextcolor = Color.fromARGB(0, 198, 109, 108);
const kbackgroundColor = Color.fromARGB(216, 249, 185, 177);
const kdefaultpadding = 20.0;
const ksearchcolor = const Color(0xfff08080);
const kbackgroundColor2 = const Color(0xfffcc5ad);
const ktilecolor = const Color(0xffFBC4AB);
const kthemecolor = Color.fromARGB(255, 13, 109, 252);
const kdefaultshadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Color.fromARGB(255, 255, 225, 209));

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
  "Zellweger syndrome",
  "Aarskog-Scott syndrome",
  "Acute intermittent porphyria",
  "Adrenoleukodystrophy",
  "Aicardi syndrome",
  "Alagille syndrome",
  "Alexander disease",
  "Angelman syndrome",
  "Antiphospholipid syndrome",
  "Apert syndrome",
  "Ataxia-telangiectasia",
  "Barth syndrome",
  "Batten disease",
  "Becker muscular dystrophy",
  "Berger's disease",
  "Bloom syndrome",
  "Brugada syndrome",
  "Canavan disease",
  "Capgras syndrome",
  "Carcinoid syndrome",
  "Cartilage-hair hypoplasia",
  "Castleman disease",
  "Charcot-Marie-Tooth disease",
  "Choroideremia",
  "Chronic inflammatory demyelinating polyneuropathy",
  "Churg-Strauss syndrome",
  "Coffin-Lowry syndrome",
  "Congenital adrenal hyperplasia",
  "Congenital diaphragmatic hernia",
  "Cri-du-chat syndrome",
  "Crigler-Najjar syndrome",
  "Cronkhite-Canada syndrome",
  "Crouzon syndrome",
  "Cyclic vomiting syndrome",
  "Dandy-Walker syndrome",
  "Diamond-Blackfan anemia",
  "Dravet syndrome",
  "Dubowitz syndrome",
  "Duchenne muscular dystrophy",
  "Eagle syndrome",
  "Epidermolysis bullosa",
  "Fabry disease",
  "Familial Mediterranean fever",
  "Fragile X syndrome",
  "Friedreich's ataxia",
  "Gardner syndrome",
  "Gastroparesis",
  "Gilles de la Tourette syndrome",
  "Glutaric acidemia type 1",
  "Gorlin syndrome",
  "Hajdu-Cheney syndrome",
  "Hereditary angioedema",
  "Hermansky-Pudlak syndrome",
  "Holt-Oram syndrome",
  "Hurler syndrome",
  "Hutchinson-Gilford progeria syndrome",
  "Hyper IgM syndrome",
  "Hyperhidrosis",
  "Hypophosphatasia",
  "Icell syndrome",
  "Ichthyosis",
  "Incontinentia pigmenti",
  "Jeune syndrome",
  "Joubert syndrome",
  "Klinefelter syndrome",
];

const kiconcolor = Color.fromARGB(255, 231, 173, 0);

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}

const LinearGradient tileGradient = LinearGradient(
  colors: [
    Color(0xFF3E4DAA),
    Color(0xFF89A3E3),
  ],
);
