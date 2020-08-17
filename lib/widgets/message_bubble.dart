import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  MessageBubble(this.messageText, this.messageSender);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Text(
                '$messageText',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
