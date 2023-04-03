import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper{
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

  //SIGN UP
  Future<String?> signUp({required String email,required String password}) async{

    try{
       await auth.createUserWithEmailAndPassword(email: email, password: password);
       return null;
    }on FirebaseAuthException catch(e){
      return e.message;
    }

  }
}