import 'package:flutter/material.dart';
import 'package:healthchats/helper/helperFunction.dart';
import 'package:healthchats/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/loginpage.dart';
import 'package:flutter/foundation.dart';
import 'shared/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: constansts.apiKey,
            appId: constansts.appId,
            messagingSenderId: constansts.messagingSenderId,
            projectId: constansts.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
   
    super.initState();
    getUserLoggedInStatus();
  }

  void getUserLoggedInStatus() async {
    await helperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Chats',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity),  
      home:
          _isSignedIn ? Home() : const logInPage(), //calling home widget on home.dart
    );
  }
}
