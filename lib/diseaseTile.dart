import 'package:flutter/material.dart';
import 'package:healthchats/chatpage.dart';
import 'package:healthchats/constants.dart';

class groupTile extends StatefulWidget {
  final String userName;
  final String groupName;
  final String groupId;
  const groupTile(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  State<groupTile> createState() => _groupTileState();
}

class _groupTileState extends State<groupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            chatPage(
              groupId: widget.groupId,
              groupName: widget.groupName,
              userName: widget.userName,
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: kthemecolor,
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          title: Text(
            widget.groupName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Join the conversion as ${widget.userName}",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
