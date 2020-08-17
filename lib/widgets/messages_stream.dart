import 'package:flutter/material.dart';
import 'package:fire_chat/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesStream extends StatelessWidget {
  final Firestore _firestore;
  final String collectionName;
  final String logedInuser;
  const MessagesStream({
    Key key,
    @required Firestore firestore,
    @required this.collectionName,
    @required this.logedInuser
  }) : _firestore = firestore, super(key: key);



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(collectionName).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageWidget = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final isUser = logedInuser == messageSender;
          // print(isUser);
          final text = MessageBubble(
            messageText: messageText,
            messageSender: messageSender,
            isUser: isUser
          );
          messageWidget.add(text);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 18),
            children: messageWidget,
          ),
        );
      },
    );
  }
}