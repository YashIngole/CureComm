import 'package:healthchats/auth/loginpage2.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/profile.dart';
import 'package:healthchats/service/auth-service.dart';
import 'package:flutter/material.dart';
import 'policies.dart';
import "about_page.dart";

Drawer navbar(BuildContext context, String userName, String email) {
  // String userName = "";
  // String email = "";
  AuthService authService = AuthService();

  return Drawer(
    child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 30),
      children: [
        const Icon(
          Icons.account_circle_rounded,
          size: 150,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          userName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        Text(
          email,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.purple,
          ),
          title: const Text("Profile"),
          onTap: () {
            nextScreen(context, profilePage());
          },
        ),
        // ListTile(
        //   leading: const Icon(
        //     Icons.favorite,
        //     color: Colors.pink,
        //   ),
        //   title: const Text("Favorites"),
        //   onTap: () {},
        // ),
        ListTile(
          leading: const Icon(
            Icons.people,
            color: Colors.blue,
          ),
          title: const Text("Friends"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.share,
            color: Colors.green,
          ),
          title: const Text("Share"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.notifications,
            color: Colors.yellow,
          ),
          title: const Text("Requests"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: Colors.black87,
          ),
          title: const Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.description,
            color: Colors.brown,
          ),
          title: const Text("Policies"),
          onTap: () {
            nextScreen(context, TermsAndConditionsPage());
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
            color: Colors.deepOrange,
          ),
          title: const Text("About"),
          onTap: () {
            nextScreen(context, AboutPage());
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.purple,
          ),
          title: const Text("Log out"),
          onTap: () async {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Log out"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("Log out"),
                      onPressed: () {
                        authService.signOut().whenComplete(() {
                          nextScreenReplace(context, const loginpage2());
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
        )
      ],
    ),
  );
}
