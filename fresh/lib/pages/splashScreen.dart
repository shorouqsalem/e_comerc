// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), NavigatorSecondPage);
  }
  void NavigatorSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpeg"),
                fit: BoxFit.cover)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                Image.asset(
                  "images/logo-removebg-preview.png",
                  fit: BoxFit.fill,
                ),
                ],
                ),
                ),
                
      ),
      
      );

  }
}
