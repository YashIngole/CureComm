import 'package:healthchats/constants.dart';
import 'package:healthchats/service/auth-service.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:flutter/material.dart';
import 'body.dart';
import 'home.dart';

Drawer navbar(String userName, String email) {
  // String userName = "";
  // String email = "";
  AuthService authService = AuthService();

  return Drawer(
    child: ListView(
      padding: EdgeInsets.symmetric(vertical: 30),
      children: [
        Icon(
          Icons.account_circle,
          size: 150,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          userName,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        Text(
          email,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.pink,
          ),
          title: Text("Favorites"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Colors.blue,
          ),
          title: Text("Friends"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.share,
            color: Colors.green,
          ),
          title: Text("Share"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.notifications,
            color: Colors.yellow,
          ),
          title: Text("Requests"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.black87,
          ),
          title: Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.description,
            color: Colors.brown,
          ),
          title: Text("Policies"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.info,
            color: Colors.deepOrange,
          ),
          title: Text("About"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.purple,
          ),
          title: Text("Log out"),
          onTap: () {
            authService.signOut();
          },
        )
      ],
    ),
  );
}
