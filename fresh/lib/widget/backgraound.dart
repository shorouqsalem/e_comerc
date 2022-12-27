// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BackgraoundImage extends StatelessWidget {
  const BackgraoundImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
         height: size.height,
          child: Image.asset(
            "images/background.jpeg",
            fit: BoxFit.fill,
          ),
        ),
        Image.asset(
          "images/logo-removebg-preview.png",
          fit: BoxFit.fill,
          
        ),
      ],
    );
  }
}
