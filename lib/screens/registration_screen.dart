import 'package:fire_chat/constants.dart';
import 'package:fire_chat/services/auth.dart';
import 'package:fire_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthServices _auth = AuthServices();
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
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter email'),
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
                  color: Colors.blueAccent,
                  text: 'Register',
                  onPressed: () async {
                    /*try{
                      
                      final _auth = FirebaseAuth.instance;
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      print(newUser);
                      if(newUser != null){
                        Navigator.pushNamed(context, ChatScreen.routeName);
                      }
                    }catch(e){
                      print('Error');
                      print(e.toString());
                    }*/
                    dynamic user = _auth.signInAnno();
                    if(user==null){
                      print('Error login');
                    }else{
                      print('loged in');
                      print(user);
                    }

                    // print('$email $password');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


