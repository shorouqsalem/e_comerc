// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fresh/pages/Vegetable.dart';
import 'package:fresh/pages/catigories.dart';
import 'package:fresh/pages/language.dart';
import 'pages/fruitPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
 import 'pages/cartScreen.dart';
// import 'pages/catigories.dart';

// import 'pages/login.dart';
// import 'pages/regestration.dart';
// import 'pages/splashScreen.dart';

void main() async {

  runApp(MyApp(

  ));
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  String getLocale() {
    return _locale!.languageCode.toString();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Language(),
    );
  }
}
