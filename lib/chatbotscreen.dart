import 'package:flutter/material.dart';
// import 'package:healthchats/constants.dart';
import 'chat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QueryChat());
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Custom app bar color
          foregroundColor: Colors.white, // Custom app bar text color
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const ChatScreen(),
    );
  }
}
