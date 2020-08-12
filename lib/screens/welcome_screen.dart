import 'package:fire_chat/screens/chat_screen.dart';
import 'package:fire_chat/screens/login_screen.dart';
import 'package:fire_chat/screens/registration_screen.dart';
import 'package:fire_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'wellcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {


  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blue,end: Colors.red).animate(controller);
    controller.forward();
    // controller.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     controller.reverse();
    //   }else if(status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });
    controller.addListener(() {
      // print(animation.value);
      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 500),
                  totalRepeatCount: 5,
                  pause: Duration(seconds: 2),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              text: 'Log in',
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              color: Colors.blue[300],
            ),
            SizedBox(height: 20),
            RoundedButton(
              text: 'Register user',
              onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20),
            RoundedButton(
              text: 'Chat screen',
              onPressed: (){
                Navigator.pushNamed(context, ChatScreen.routeName);
              },
              color: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}
