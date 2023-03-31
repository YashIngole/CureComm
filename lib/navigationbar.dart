import 'package:healthchats/constants.dart';
import 'package:healthchats/service/auth-service.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:flutter/material.dart';

Drawer navbar() {
 AuthService authService = AuthService();
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("UserName"),
          accountEmail: Text("UserName@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(color: ktilecolor),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("Favorites"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text("Friends"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text("Share"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Requests"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.description),
          title: Text("Policies"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("About"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Log out"),
          onTap: () {
            authService.signOut();
          },
        )
      ],
    ),
  );
}