import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/groupInfo.dart';
import 'package:healthchats/service/database-service.dart';

class chatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const chatPage(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  Stream<QuerySnapshot>? chats;
  String admin = "";
  @override
  void initState() {
    getChatAndAdmins();
    super.initState();
  }

  void getChatAndAdmins() {
  databaseService().getChats(widget.groupId).then((val) {
    setState(() {
      chats = val;
    });
  });
  databaseService().getGroupAdmin(widget.groupId).then((val) {
    setState(() {
      admin = val;
    });
  });
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: kthemecolor,
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                    context,
                    groupInfo(
                      adminName: "Yash Ingole",
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                    ));
              },
              icon: Icon(Icons.info))
        ],
      ),
    );
  }
}
