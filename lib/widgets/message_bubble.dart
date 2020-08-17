import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isUser;
  MessageBubble({
    @required this.messageText,
    @required this.messageSender,
    @required this.isUser
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 5),
      child: Column(
        crossAxisAlignment: isUser?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            '$messageSender',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white60
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isUser ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ):BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ),
            color: isUser?Colors.lightBlueAccent:Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Text(
                '$messageText',
                style: TextStyle(
                  fontSize: 16.0,
                  color: isUser?Colors.white:Colors.black54
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
