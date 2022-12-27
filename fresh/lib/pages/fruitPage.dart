// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fresh/fruit_controler.dart';
import 'package:fresh/model/datamodel.dart';
import 'package:fresh/pages/language.dart';
import 'package:http/http.dart' as http;
import 'cartScreen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Fruit extends StatefulWidget {
  const Fruit({super.key});

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  FruitControler controler = FruitControler();
  List<FritCatigoodel> listCatigory = [];
  Future<List<FritCatigoodel>>? getCatigory() async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
      'POST',
      Uri.parse('http://185.177.126.94:4044/WebService1.asmx/GetProduct'),
    );
    request.bodyFields = {
      'categoryID': '1',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    // print(await response.stream.bytesToString());
    Map<String, dynamic> test =
        jsonDecode(await response.stream.bytesToString());
    test["Data"].map((data) {
      listCatigory.add(FritCatigoodel.fromJson(data));
    }).toList();

    return listCatigory;
  }

  static final List<String> Quntity = <String>[
    '50 Gram',
    '1 keloGram',
    '1.5 Gram',
    '2 KeloGram'
  ];
  String selectedQuntity = Quntity.first;
  int SelectedIndix = 0;
  List<Widget> WidgetPages = [
    Language(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            
            Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Badge(
                  badgeContent: Text(
                    '${controler.selectedFruit.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: Icon(
                    Icons.shopping_basket,
                  ),
                )),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, anotherAnimation) {
                        return const Cart();
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
                  icon: Icon(Icons.shopping_cart),
                  color: Color.fromARGB(255, 5, 66, 7),
                  iconSize: 25,
                ),
                backgroundColor: Colors.white,
                radius: 17,
              ),
            ),
          ],
          title: Text(
            AppLocalizations.of(context)!.fruits,
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Color.fromARGB(255, 5, 66, 7),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: FutureBuilder<List<FritCatigoodel>>(
              future: getCatigory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // ignore: avoid_print
                  print(snapshot.hasData.toString());
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return singleProduct(snapshot.data![index]);
                    }),
                    itemCount: snapshot.data!.length,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )));
  }

  singleProduct(FritCatigoodel modelF) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 237, 237),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
        //فكرة هاي الودجت اني اخلي الاشي ينكبس عليه
        GestureDetector(
          onTap: (() {
            controler.selectedFruit.add(modelF);
            setState(() {});
          }),
          child: Image.network(
              "https://th.bing.com/th/id/R.6ac1dddbaaf8a6abba2330a14d2b6ff7?rik=YjLr8B6i8GMwEA&riu=http%3a%2f%2fpngimagesfree.com%2fFruit%2fApple%2fApple-png-transparent-image.png&ehk=icSgVeUpmzhw8nN4Zd1L%2bNTx1an5cRRw4MCXF8oziqM%3d&risl=&pid=ImgRaw&r=0"),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  modelF.prduct_Name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  modelF.price.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ]),
        ),
        
      ]
      
      ),
     
    );
    
  }
}
