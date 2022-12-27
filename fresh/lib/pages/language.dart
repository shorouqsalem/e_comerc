// ignore_for_file: unnecessary_import, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh/widget/backgraound.dart';

import '../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'catigories.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}
//List languageCode=["en" , "ar"];

class _LanguageState extends State<Language> {
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

                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      //Button for English
                      child: ElevatedButton(
                        onPressed: () {
                          MyApp.of(context)!
                            .setLocale(Locale.fromSubtags(languageCode: 'en'));
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, anotherAnimation) {
                              return const catigory();
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
                          AppLocalizations.of(context)!.language,
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
                //Button For Arabic
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        MyApp.of(context)!
                            .setLocale(Locale.fromSubtags(languageCode: 'ar'));
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, anotherAnimation) {
                            return const catigory();
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent),
                      child: Text(
                        " عربي",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                    ),
                  ),
                ),

                Spacer(),
                //uttn Fr continue
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, anotherAnimation) {
                            return const catigory();
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellowAccent),
                      child: Text(
                        AppLocalizations.of(context)!.conntinue,
                        // "Continue",
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
}
