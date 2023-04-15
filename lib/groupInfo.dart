// ignore_for_file: file_names, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/chatroomScreen.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/service/database-service.dart';

class groupInfo extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String adminName;
  const groupInfo(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.adminName});

  @override
  State<groupInfo> createState() => _groupInfoState();
}

class _groupInfoState extends State<groupInfo> {
  Stream? members;
  @override
  void initState() {
    super.initState();
    getMembers();
  }

  getMembers() async {
    await databaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getGroupMembers(widget.groupId)
        .then((val) {
      setState(() {
        members = val;
      });
    });
  }

  String getName(String r) {
    return r.substring(r.indexOf("_") + 1);
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kthemecolor,
        title: const Text("Group Info"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Exit"),
                      content: const Text("Are you sure you want to exit the group?"),
                      actions: [
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: const Text("Log out"),
                          onPressed: () {
                            databaseService(
                                    uid: FirebaseAuth.instance.currentUser!.uid)
                                .toggleGroupJoin(widget.groupId,
                                    getName(widget.adminName), widget.groupName)
                                .whenComplete(() {
                              nextScreenReplace(context, const chatRoomScreen());
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kthemecolor.withOpacity(0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: kthemecolor,
                    child: Text(
                      widget.groupName.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Group: ${widget.groupName}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Admin: ${widget.adminName}",
                          style: const TextStyle(fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: kdefaultpadding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Members: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            memberList(),
          ],
        ),
      ),
    );
  }

  Widget memberList() {
    return StreamBuilder(
      stream: members,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['members'] != null) {
            if (snapshot.data['members'].length != 0) {
              return ListView.builder(
                itemCount: snapshot.data['members'].length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: kthemecolor,
                          child: Text(
                            getName(snapshot.data['members'][index])
                                .substring(0, 1)
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                      title: Text(getName(snapshot.data['members'][index])),
                      subtitle: Text(getId(snapshot.data['members'][index])),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("NO MEMBERS"),
              );
            }
          } else {
            return const Center(
              child: Text("NO MEMBERS"),
            );
          }
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: kthemecolor,
          ));
        }
      },
    );
  }
}
