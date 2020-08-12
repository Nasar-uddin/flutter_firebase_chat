import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future signInAnno() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  
  // register with email and password
  Future signInWithEmailPass(String email, String password) async {
    try {
      var newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return newUser;
    } catch (e) {
      print('Error');
      print(e.toString());
      return null;
    }
  }
  // sing in with email and pass
  Future logIn(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(result.user);
      return result.user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // sing out
  void signOut() async {
    await _auth.signOut();
  }
  // get current user
  getCurrentUser() async {
    try {
      var user = await _auth.currentUser();
      print(user.email);
    } catch (e) {
      print(e.toString());
    }
  }
}
