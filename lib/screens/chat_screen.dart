import 'package:fire_chat/services/auth.dart';
import 'package:fire_chat/widgets/messages_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AuthServices _auth = AuthServices();
  final _firestore = Firestore.instance;
  String messageText;
  FirebaseUser logedInUser;
  bool isAuthChecked = false;
  final String collectionName = 'messages';
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getMessages();
    // messageStream();
  }

  void getCurrentUser() async {
    logedInUser = await _auth.getCurrentUser();
    setState(() {
      isAuthChecked = true;
    });
    print(logedInUser.email);
  }

  void getMessages() async {
    final messages = await _firestore.collection(collectionName).getDocuments();
    for (var message in messages.documents) {
      print(message.data);
    }
  }

  void messageStream() async {
    await for (var snapshot
        in _firestore.collection(collectionName).snapshots()) {
      /*
      for (var messages in snapshot.documents) {
        print(messages.data);
      }
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isAuthChecked) {
      return Scaffold(
        body: Center(
                child: CircularProgressIndicator(backgroundColor: Colors.red)
              ),
      );
    } else
      return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                }),
          ],
          title: Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(
                  firestore: _firestore,
                  collectionName: collectionName,
                  logedInuser: logedInUser.email),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        onChanged: (value) {
                          //Do something with the user input.
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //Implement send functionality.
                        messageController.clear();
                        _firestore.collection(collectionName).add(
                            {'text': messageText, 'sender': logedInUser.email});
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
