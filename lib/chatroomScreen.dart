// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/diseaseTile.dart';
import 'package:healthchats/searchpage.dart';
import 'service/auth-service.dart';
import 'helper/helperFunction.dart';
import 'service/database-service.dart';

class chatRoomScreen extends StatefulWidget {
  const chatRoomScreen({super.key});

  @override
  State<chatRoomScreen> createState() => _chatRoomScreenState();
}

class _chatRoomScreenState extends State<chatRoomScreen> {
  String UserName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? groups;
  bool _isLoading = false;
  String groupName = "";

  //string manipulation functions
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await helperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await helperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        UserName = val!;
      });
    });
    //getting the list of snapshots in our database
    await databaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: kthemecolor,
          title: const Text("Groups"),
          actions: [
            IconButton(
                onPressed: () {
                  nextScreen(context, const searchPage());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: groupList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            popUpDialog(context);
          },
          elevation: 0,
          backgroundColor: kthemecolor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ));
  }

  popUpDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
              title: const Text(
                "Create a new group",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kthemecolor,
                          ),
                        )
                      : TextField(
                          onChanged: (val) {
                            setState(() {
                              groupName = val;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: kthemecolor),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: kthemecolor),
                                  borderRadius: BorderRadius.circular(20))),
                        )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: kthemecolor),
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (groupName != "") {
                      setState(() {
                        _isLoading = true;
                      });
                      databaseService(
                              uid: FirebaseAuth.instance.currentUser!.uid)
                          .CreateGroup(UserName,
                              FirebaseAuth.instance.currentUser!.uid, groupName)
                          .whenComplete(() {
                        _isLoading = false;
                      });
                      Navigator.of(context).pop();
                      showSnackbar(
                          context, Colors.green, "Group created successfully.");
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: kthemecolor),
                  child: const Text("CREATE"),
                )
              ],
            );
          }));
        });
  }

  groupList() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot snapshot) {
        //make some checks
        if (snapshot.hasData) {
          if (snapshot.data['groups'] != null) {
            if (snapshot.data['groups'].length != 0) {
              return ListView.builder(
                itemCount: snapshot.data['groups'].length,
                itemBuilder: (context, index) {
                  int reverseIndex = snapshot.data['groups'].length - index - 1;
                  return groupTile(
                    groupId: getId(snapshot.data['groups'][reverseIndex]),
                    groupName: getName(snapshot.data['groups'][reverseIndex]),
                    userName: snapshot.data['fullName'],
                  );
                },
              );
            } else {
              return noGroupWidget();
            }
          } else {
            return noGroupWidget();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: kthemecolor,
            ),
          );
        }
      },
    );
  }

  noGroupWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              popUpDialog(context);
            },
            child: Icon(
              Icons.add_circle,
              color: Colors.grey[700],
              size: 75,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "You've not joined any group, tap on the add button to add a group",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
