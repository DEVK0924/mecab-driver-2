import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mecab_driver/authentication/login_screen.dart';
import 'package:mecab_driver/authentication/signup_screen.dart';
import 'package:mecab_driver/authentication/welcom_screen.dart';
import 'package:mecab_driver/mainScreens/main_screen.dart';


class MySplashScreen extends StatefulWidget 
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen> 
{
  startTimer()
  {
    Timer(const Duration(seconds: 3), () async
    {
      //send user to home screen
      Navigator.push(context, MaterialPageRoute(builder: (c)=> WelcomeScreen()));
    });
  }
  
  // this function run automatically and call startTimer function automatically
  @override
  void initState() 
  {
    super.initState();
    startTimer();
  }
  // End
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("images/driver_pic.png"),
              
              const SizedBox(height: 10,),
              
              const Text(
                "Mecab Driver App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
