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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor:Colors.blue[800],
        elevation: 0.0,
        title: Text("SignIN"),
      actions: <Widget>[
        FlatButton.icon(onPressed: (){
    widget.toggleView();
  },
      icon: Icon(Icons.person),
      label: Text("register"))
],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
     child: Form(
         key: _formkey,
         child:Column(
         children: <Widget>[
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
           SizedBox(height: 20.0,),
           RaisedButton(
             color: Colors.pink[400],
             child: Text(
               'Sign in Anonym',

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
