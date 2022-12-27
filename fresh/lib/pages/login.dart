// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh/model/datamodel.dart';
import 'package:fresh/pages/regestration.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Dio request = Dio();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpeg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "images/logo-removebg-preview.png",
                  fit: BoxFit.fill,
                ),

                // BackgraoundImage(),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: false,
                    validator: (val) {
                      if (val!.length > 100) {
                        return "User Name can't to be larger than 100 letter";
                      }
                      if (val.length < 2) {
                        return "User Name can't to be less than 2 letter";
                      }
                      return null;
                    },
                    cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Enter User Name",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Container(
                          margin: EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            "User Name",
                            style: TextStyle(color: Colors.white),
                          )),
                      suffixIcon: Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: isHiddenPassword,
                  validator: (val) {
                    if (val!.length > 100) {
                      return "Pass Word can't to be larger than 100 letter";
                    }
                    if (val.length < 2) {
                      return "Pass Word can't to be less than 8 letter";
                    }
                    return null;
                  },
                  cursorColor: Colors.amberAccent,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Enter Pass Word",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                        margin: EdgeInsets.symmetric(horizontal: 9),
                        child: Text(
                          "Pass Word",
                          style: TextStyle(color: Colors.white),
                        )),
                    suffixIcon: InkWell(
                      onTap: _toasswordview,
                      child: (Icon(
                        Icons.visibility,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),

                Spacer(),

                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        var headers = {
                          'Content-Type': 'application/x-www-form-urlencoded'
                        };
                        var request = http.Request(
                          'POST',
                          Uri.parse(
                              'http://185.177.126.94:4044/WebService1.asmx/GetCustmerCredential'),
                        );
                        request.bodyFields = {
                          'email': 'shorouq@gmail.com',
                          'password': '2468'
                        };
                        request.headers.addAll(headers);

                        http.StreamedResponse response = await request.send();

                        if (response.statusCode == 200) {
                          LoginModel model=LoginModel.fromJson(jsonDecode(await response.stream.bytesToString()));
                          print( model.first_Name);
                        } else {
                          print(response.reasonPhrase);
                        }
                        // formController.selectedForm =
                        //     formController.allForm[index];
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const QuestionScreen()),
                        // );
                        // request.options.headers.addAll({
                        //   'Content-Type': 'application/x-www-form-urlencoded'
                        // });
                        // final response = await request.post(
                        //   'http://185.177.126.94:4044/WebService1.asmx?op=GetCustmerCredential',
                        //   data: {
                        //     "email": "eman@gmail.com",
                        //     "password": "2468",
                        //   },
                        // );
                        // print(response.data);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(161, 119, 63, 63)),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, anotherAnimation) {
                        return const Restration();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ));
                  },
                  child: Text(
                    "sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toasswordview() {
    //طريقة اخرى بدل جلة الشرط
    // isHiddenPassword=!isHiddenPassword
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
