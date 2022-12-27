// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/datamodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Vegetable.dart';
import 'fruitPage.dart';

class catigory extends StatefulWidget {
  const catigory({super.key});

  @override
  State<catigory> createState() => _catigoryState();
}

class _catigoryState extends State<catigory> {
  int catigory = 1;

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
                  height: 40,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      //Button For Vegetable
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, anotherAnimation) {
                              return const Vegetables();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent),
                        child: Text(
                          AppLocalizations.of(context)!.vegetables,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, anotherAnimation) {
                          return const Fruit();
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
             //هذا الفكش لاحضار الاتا من الويب سيرفس
                      // onPressed: () async {
                      //   var headers = {
                      //     'Content-Type': 'application/x-www-form-urlencoded'
                      //   };
                      //   var request = http.Request(
                      //     'POST',
                      //     Uri.parse(
                      //         'http://185.177.126.94:4044/WebService1.asmx/GetProduct'),
                      //   );
                      //   request.bodyFields = {
                      //     'categoryID': '1',
                      //   };
                      //   request.headers.addAll(headers);

                      //   http.StreamedResponse response = await request.send();

                      //   print(await response.stream.bytesToString());
                      //   if (response.statusCode == 200) {
                      //     FritCatigoodel model = FritCatigoodel.fromJson(
                      //         jsonDecode(
                      //             await response.stream.bytesToString()));
                      //     print(model.prduct_Name);
                      //   } else {}
                      // },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent),
                      child: Text(
                        
                    AppLocalizations.of(context)!.fruits,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
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
}
