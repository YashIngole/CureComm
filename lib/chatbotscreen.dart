import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'chat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(QueryChat());
}

class QueryChat extends StatelessWidget {
  const QueryChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disease Query Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat', // Custom font
        appBarTheme: AppBarTheme(
          backgroundColor: kthemecolor, // Custom app bar color
          foregroundColor: Colors.white, // Custom app bar text color
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const ChatScreen(),
    );
  }
}
