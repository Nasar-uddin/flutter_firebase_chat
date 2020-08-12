import 'package:flutter/material.dart';
import 'package:fire_chat/screens/welcome_screen.dart';
import 'package:fire_chat/screens/login_screen.dart';
import 'package:fire_chat/screens/registration_screen.dart';
import 'package:fire_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context)=> WelcomeScreen(),
        LoginScreen.routeName: (context)=> LoginScreen(),
        RegistrationScreen.routeName: (context)=> RegistrationScreen(),
        ChatScreen.routeName: (context)=> ChatScreen()
      },
    );
  }
}