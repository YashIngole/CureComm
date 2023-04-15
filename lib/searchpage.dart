// ignore_for_file: camel_case_types, non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/chatpage.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/helper/helperFunction.dart';
import 'package:healthchats/service/database-service.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  QuerySnapshot? searchSnapshot;
  bool hasUserSearched = false;
  String userName = "";
  // bool isJoined = false;

  User? user;
  List<QueryDocumentSnapshot> searchResults = [];
  ValueNotifier<String> searchText = ValueNotifier<String>("");

  @override
  void initState() {
    super.initState();
    getCurretUserIdAndName();
    searchGroups("");
  }

  getCurretUserIdAndName() async {
    await helperFunctions.getUserNameFromSF().then((value) {
      setState(() {
        userName = value!;
      });
    });
    user = FirebaseAuth.instance.currentUser;
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
        title: const Text(
          "Search",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: kthemecolor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        hintText: "Search Groups...",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                    onChanged: (value) => searchGroups(value),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: kthemecolor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kthemecolor,
                  ),
                )
              : Expanded(child: GroupList())
        ],
      ),
    );
  }

  void searchGroups(String searchText) async {
    setState(() {
      isLoading = true;
    });

    final snapshot = await FirebaseFirestore.instance
        .collection('groups')
        .where('groupName', isGreaterThanOrEqualTo: searchText)
        .where('groupName', isLessThan: '${searchText}z')
        .get();

    setState(() {
      searchResults = snapshot.docs;
      isLoading = false;
      hasUserSearched = true;
    });
  }

  GroupList() {
    if (!hasUserSearched) {
      return Container();
    }
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: kthemecolor,
        ),
      );
    }
    if (searchResults.isEmpty) {
      return const Center(
        child: Text("No results found"),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        QueryDocumentSnapshot group = searchResults[index];
        return groupTile(
            userName, group['groupId'], group['groupName'], group['admin']);
      },
    );
  }

  Future<bool> isJoined(
      String userName, String groupId, String groupName, String admin) async {
    return await databaseService(uid: user!.uid)
        .isUserJoined(groupName, groupId, userName);
  }

  Widget groupTile(
      String userName, String groupId, String groupName, String admin) {
    return FutureBuilder<bool>(
      future: isJoined(userName, groupId, groupName, admin),
      builder: (context, snapshot) {
        bool isJoined = snapshot.data ?? false;
        return ListTile(
          // ...
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: kthemecolor,
            child: Text(
              groupName.substring(0, 1).toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            groupName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Admin : ${getName(admin)} "),
          trailing: InkWell(
            onTap: () async {
              bool isJoining = !isJoined;
              await databaseService(uid: user!.uid)
                  .toggleGroupJoin(groupId, userName, groupName);
              setState(() {
                isJoined = isJoining;
              });
              if (isJoining) {
                showSnackbar(
                    context, Colors.green, "Successfully joined the group");
                Future.delayed(const Duration(seconds: 2), () {
                  nextScreen(
                      context,
                      chatPage(
                          groupId: groupId,
                          groupName: groupName,
                          userName: userName));
                });
              } else {
                showSnackbar(context, Colors.red,
                    "Successfully left the group $groupName");
              }
            },
            child: isJoined
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        border: Border.all(color: Colors.white, width: 1)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Text(
                      "Joined",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: kthemecolor, width: 1)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Text(
                      "Join",
                      style: TextStyle(color: kthemecolor),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
