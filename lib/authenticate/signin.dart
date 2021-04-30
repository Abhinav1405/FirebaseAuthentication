import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/service/auth.dart';
import 'package:music_player_app/shared/constants.dart';
import 'package:music_player_app/user.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth= AuthService();
  final _formkey=GlobalKey<FormState>();
  String email='';
  String error='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
  backgroundColor:Colors.pinkAccent[200],
        elevation: 0.0,
      //  centerTitle: true,
        title: Text("Sign In",
          style: TextStyle( fontWeight: FontWeight.bold,
    ),
        ),
      actions: <Widget>[
        FlatButton.icon(onPressed: (){
    widget.toggleView();
  },
      icon: Icon(Icons.person,color: Colors.white,),
      label: Text("Register",
      style: TextStyle(
        color: Colors.white,
      ),))
],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
       child: Form(
           key: _formkey,
           child:Column(
           children: <Widget>[
             Center(
               child: CircleAvatar(
                 backgroundImage: AssetImage('assets/Music Icon.png',
                 ),
                 radius: 60.0,
               ),
             ),
             SizedBox(height: 20.0,),
             TextFormField(
               decoration: textInputDecoration.copyWith(hintText: 'Email'),
               validator: (val)=>val.isEmpty? 'Enter an email':null,
               onChanged: (val){
setState(() {
  email=val;
});
               },
             ),
             SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val)=>val.length<8? 'Enter a strong password 8+char': null,
                obscureText: true,
                onChanged: (val){
setState(() {
  password=val;
});
                },
              ),
             SizedBox(height: 20.0,),
             RaisedButton(
               color: Colors.pink[400],
               child: Text(
                 'Sign in',
                 style: TextStyle(
                     color: Colors.white,
                   fontWeight: FontWeight.bold,
                 ),

               ),
               onPressed: ()async{
                 if(_formkey.currentState.validate()) {
                   dynamic result=await _auth.SignInwithEmailandPAssword(email, password);
                   if(result==null){
                     setState(() {
                       error='please check you email or password';
                     });
                   }
                 }    },
             ),
             SizedBox(height: 10.0,),
             RaisedButton(
               color: Colors.pink[400],
               child: Text(
                 'Sign in Anonymously',
style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,

),
               ),
               onPressed: ()async {
                 dynamic result = await _auth.signinAnon();
               },

             ),

           ],
       ),
       ),

        ),
      ),
    );
  }
}
