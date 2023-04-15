import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:healthchats/constants.dart';
import 'package:healthchats/home.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';
import 'threedots.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  late OpenAI? chatGPT;
  bool _isImageSearch = false;
  bool _isTyping = false;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
      token: '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',
      baseOption: HttpSetup(receiveTimeout: Duration(seconds: 6)),
    );

    // Add a welcome message to the chat
    _messages.insert(
      0,
      ChatMessage(
        text: "Welcome to the Disease Troubleshooter! How can I assist you?",
        sender: "bot",
        isImage: false,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    chatGPT?.close();
    chatGPT?.genImgClose();
    super.dispose();
  }

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    // prompt to the user's message
    final prompt =
        "this is prompt that will answer only to query related to diseases where user can ask question, the text after the semicolor is user input dont answer any random questions except related to diseases: ${message.text}.";

    final request = CompleteText(prompt: prompt, model: 'text-davinci-003');

    final response = await chatGPT!.onCompletion(request: request);
    Vx.log(response!.choices[0].text);
    insertNewData(response.choices[0].text, isImage: false);
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (value) => _sendMessage(),
              decoration: const InputDecoration.collapsed(
                hintText: "Describe your symptoms or Medical Query",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _isImageSearch = false;
              _sendMessage();
            },
          ),
        ],
      ).px16(),
    ).pSymmetric(v: 8, h: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 185, 127),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 185, 127),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => nextScreen(context, Home()),
          ),
          title: const Text(
            "Disease Troubleshooter",
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 247, 185, 127),
                Colors.blueGrey.shade100,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: Vx.m8,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    },
                  ),
                ),
                if (_isTyping) const ThreeDots(),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: _buildTextComposer(),
                ),
                SizedBox(
                  height: 21,
                )
              ],
            ),
          ),
        ));
  }
}
