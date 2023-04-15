import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: sender == "user" ? Colors.red[200] : Colors.green[200],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.only(right: 16),
          child: Text(
            sender,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    text.trim(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
        ),
      ],
    ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8);
  }
}
