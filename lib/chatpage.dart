// ignore_for_file: camel_case_types, annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/groupInfo.dart';
import 'package:healthchats/messageTile.dart';
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
  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

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
              icon: const Icon(Icons.info))
        ],
      ),
      body: Column(
        children: <Widget>[
          //chat messages here
          Expanded(
            child: chatMessages(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[700],
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Send a message",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        border: InputBorder.none),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: kthemecolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        // Wait for the ListView to build before scrolling to the bottom
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
        return ListView.builder(
          controller: _scrollController,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            return messageTile(
                message: snapshot.data.docs[index]['message'],
                sender: snapshot.data.docs[index]['sender'],
                sentByMe:
                    widget.userName == snapshot.data.docs[index]['sender']);
          },
        );
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      databaseService().sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
      });
    }
  }
}
