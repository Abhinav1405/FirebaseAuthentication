import 'package:flutter/material.dart';
import 'package:music_player_app/service/auth.dart';
class Home extends StatelessWidget {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("music player"),
        backgroundColor: Colors.amber[200],
        actions: <Widget>[
          FlatButton.icon(onPressed:()async{
            await _auth.signout();
          },icon: Icon(Icons.person), label: Text("SIgnout")),
        ],
      ),
    );
  }
}
