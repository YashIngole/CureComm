import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.text,
    required this.sender,
    this.isImage = false,
  }) : super(key: key);

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    const background = Color.fromARGB(255, 137, 163, 227);
    const foreground = Color.fromARGB(255, 62, 77, 170);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sender == "user")
          Container(
            width: 60,
          ), // Add a fixed width container to align user chat box to the left
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "user"
                ? Color.fromARGB(255, 204, 178, 255)
                : Color.fromARGB(255, 242, 180, 9))
            .p4
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    text,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const CircularProgressIndicator.adaptive(),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: sender == "user"
                          ? Radius.circular(12)
                          : Radius.circular(0),
                      bottomRight: sender != "user"
                          ? Radius.circular(12)
                          : Radius.circular(0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.alphaBlend(foreground, background),
                        Color.fromARGB(255, 137, 163, 227),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          sender == "user" ? 16.0 : 8.0,
                          8.0,
                          sender == "user" ? 8.0 : 16.0,
                          8.0,
                        ),
                        child: text.trim().text.white.bodyText1(context).make(),
                      ),
                      if (sender != "user")
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipPath(
                            clipper: MessageClipper(),
                            child: Container(
                              width: 1,
                              height: 1,
                              color: foreground,
                            ),
                          ),
                        ),
                    ],
                  ).px4(),
                ),
        ),
        if (sender != "user")
          Container(
            width: 60,
          ), // Add a fixed width container to align sender chat box to the right
      ],
    ).py4();
  }
}

class MessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(5, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
