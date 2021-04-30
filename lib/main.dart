import 'package:flutter/material.dart';
import 'package:music_player_app/authenticate/authenticate.dart';
import 'package:music_player_app/home/home.dart';
import 'package:music_player_app/service/auth.dart';
import 'package:music_player_app/user.dart';
import 'package:provider/provider.dart';
import 'package:music_player_app/home/wrapper.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
