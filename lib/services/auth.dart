import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final _auth = FirebaseAuth.instance;
   Future signInAnno() async {
        try{
            AuthResult result = await _auth.signInAnonymously();
            FirebaseUser user = result.user;
            return user;
        }catch(e){
            print(e);
            return null;
        }
    }
    // sing in with email and pass

    // register with email and password

    // sing out
}