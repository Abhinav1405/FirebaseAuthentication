import 'package:flutter/material.dart';
import 'package:music_player_app/authenticate/authenticate.dart';
import 'package:music_player_app/home/home.dart';
import 'package:music_player_app/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    print(user);
    if(user==null) {
      return Authenticate();
    }else{
      return Home();
    }
    }
}
