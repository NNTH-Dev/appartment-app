import 'package:appartmentapp/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{
  final String username;
  const HomeScreen({
    Key? key,
    this.username = "",
  }) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Xin chào " + this.username  ,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              color: Colors.grey,
            )
          )
        ],
      ),
    );
  }
}