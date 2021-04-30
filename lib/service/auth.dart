import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player_app/authenticate/signin.dart';
import 'package:music_player_app/user.dart';
class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  User _userfromFirebase(FirebaseUser user){
    return user !=null? User(uid: user.uid) :null;
  }
Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userfromFirebase);
}
  Future signinAnon()async{
    try{
AuthResult result=await _auth.signInAnonymously();
FirebaseUser user=result.user;
return _userfromFirebase(user);
    }catch(e){
print(e.toString());
return null;
    }
  }
  Future registerwithEmailandPAssword(String email, String password) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user= result.user;
      return _userfromFirebase(user);
    }catch(e){
    print(e.toString()) ;
    return null;
    }
  }
  Future SignInwithEmailandPAssword(String email, String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _userfromFirebase(user);
    }catch(e){
      print(e.toString()) ;
      return null;
    }
  }
  Future signout()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }

}