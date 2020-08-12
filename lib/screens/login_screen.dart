import 'package:fire_chat/constants.dart';
import 'package:fire_chat/screens/chat_screen.dart';
import 'package:fire_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter email')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RoundedButton(
                  color: Colors.blue[300],
                  text: 'Login',
                  onPressed: () async {
                    final _auth = FirebaseAuth.instance;
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user!=null){
                         Navigator.pushNamed(context, ChatScreen.routeName);
                      }
                    }catch(e){
                      print('Error');
                      print(e.toString());
                    }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
