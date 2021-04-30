import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_player_app/service/auth.dart';
import 'package:music_player_app/shared/constants.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor:Colors.pinkAccent[200],
        elevation: 0.0,
        title: Text("Register",
        style: TextStyle(
          color: Colors.white,
        ),),
actions: <Widget>[
 FlatButton.icon(onPressed: (){
   widget.toggleView();
 }, icon: Icon(Icons.person,color: Colors.white,), label: Text('Sign in',
 style: TextStyle(
   color: Colors.white,
 ),
 )
 )
],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
              key:_formKey,
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
                decoration:textInputDecoration,
                obscureText: true,
                validator: (val)=>val.length<8? 'Enter a strong password 8+char': null,

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
                  'Register',
 style: TextStyle(
   color: Colors.white,
   fontWeight: FontWeight.bold,
 ),
                ),
                onPressed: ()async{
                  if(_formKey.currentState.validate()){
                  dynamic result=await _auth.registerwithEmailandPAssword(email, password);
                  if(result==null){
                    setState(() {
                      error="please supply a valid email";
                    });
                  }
                  }
                },
              ),
              SizedBox(height: 12.0,)
              ,
              Text(
                error,
                style:TextStyle(color: Colors.red,fontSize: 14.0),
              ),

            ],
          )),
        ),
      ),
    );
  }
}
