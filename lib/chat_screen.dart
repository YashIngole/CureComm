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
  bool _isTyping = false;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
      token: 'API-KEY',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 6)),
    );

    // Add a welcome message to the chat
    _messages.insert(
      0,
      const ChatMessage(
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
        color: Color.fromARGB(255, 186, 200, 255),
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
                hintText: "Type here...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => nextScreen(context, const Home()),
        ),
        title: const Text(
          "Chat Bot",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color.fromARGB(255, 20, 33, 103),
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Frame 1.jpg"),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: Vx.m4,
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
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: _buildTextComposer(),
              ),
              const SizedBox(
                height: 21,
              )
            ],
          ),
        ),
      ),
    );
  }
}
