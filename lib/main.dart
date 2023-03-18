import 'package:flutter/material.dart';
import 'package:healthchats/home.dart';
import 'package:healthchats/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Chats',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Ktextcolor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
    );
  }
}
