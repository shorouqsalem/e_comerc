// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh/api/http_api.dart';

class Restration extends StatefulWidget {
  const Restration({super.key});

  @override
  State<Restration> createState() => _RestrationState();
}

class _RestrationState extends State<Restration> {
  bool isHiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    HttpClientUtils.init();
    super.initState();
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
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ],
                ),
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
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.length > 100) {
                        return "Email can't to be larger than 100 letter";
                      }
                      if (val.length < 2) {
                        return "Email can't to be less than 2 letter";
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
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Container(
                          margin: EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            "Email",
                            style: TextStyle(color: Colors.white),
                          )),
                      suffixIcon: Icon(
                        Icons.email_outlined,
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
                          "PassWord",
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
                      onPressed: () {
                        HttpClientUtils.login().then((value) async {
                          String reply =
                              await value.transform(utf8.decoder).join();
                          Map<String, dynamic> result = jsonDecode(reply);
                          // Map<String, dynamic> ListMoel=result["country"];
                          //final items = (result["country"] as List)
                              //.map((i) =>  DataModel.fromJson(i));
                        //   for (final item in items) {
                        //     print(item.country_id);
                        //   }
                         }
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(161, 119, 63, 63)),
                      ),
                    ),
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
