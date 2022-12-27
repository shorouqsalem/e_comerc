// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/datamodel.dart';
import 'catigories.dart';
import 'language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => __VegetablesState();
}

class __VegetablesState extends State<Vegetables> {
  List<VegetableModel> listCatigory = [];
  Future<List<VegetableModel>>? getCatigory() async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
      'POST',
      Uri.parse('http://185.177.126.94:4044/WebService1.asmx/GetProduct'),
    );
    request.bodyFields = {
      'categoryID': '2',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    // print(await response.stream.bytesToString());
    Map<String, dynamic> test =
        jsonDecode(await response.stream.bytesToString());
    test["Data"].map((data) {
      listCatigory.add(VegetableModel.fromJson(data));
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
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                child: IconButton(
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
                  icon: Icon(Icons.home),
                  color: Color.fromARGB(255, 5, 66, 7),
                  iconSize: 25,
                ),
                backgroundColor: Colors.white,
                radius: 17,
              ),
            ),

            // CircleAvatar(

            //   child: Icon(
            //     Icons.home,
            //     color: Color.fromARGB(255, 5, 66, 7),
            //   ),
            //   radius: 17,
            //   backgroundColor: Colors.white,
            //   //backgroundColor: Color.fromARGB(255, 138, 195, 140),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                child: Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 5, 66, 7),
                ),
                radius: 17,
                backgroundColor: Colors.white,
                //backgroundColor: Color.fromARGB(255, 138, 195, 140),
              ),
            ),
          ],
          title: Text(
            AppLocalizations.of(context)!.vegetables,
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Color.fromARGB(255, 5, 66, 7),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: FutureBuilder<List<VegetableModel>>(
              future: getCatigory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // ignore: avoid_print
                  print(snapshot.hasData.toString());
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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

  singleProduct(VegetableModel modelF) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 237, 237),
          borderRadius: BorderRadius.circular(10)),
      child: 
        Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
           
        Expanded(
            flex: 2,
            child: Image.network(
                "https://th.bing.com/th/id/OIP.TzuDFqPmNoCF6yY3HHo_GwHaGS?pid=ImgDet&rs=1")),
        Expanded(
            // ignore: prefer_const_literals_to_create_immutables
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  children: [
                    Expanded(
                      // flex: 2,

                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Color.fromARGB(255, 5, 66, 7),
                            borderRadius: BorderRadius.circular(8)),
                        width: 15,
                        height: 15,
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          dropdownColor: Color.fromARGB(255, 230, 231, 217),
                          alignment: Alignment.centerRight,
                          underline: Divider(
                            thickness: 0,
                          ),
                          isExpanded: false,
                          hint: Text(
                            " Quntity",
                            style: TextStyle(
                              color: Color.fromARGB(255, 237, 244, 42),
                              fontSize: 10,
                            ),
                          ),
                          items:
                              Quntity.map((Quntity) => DropdownMenuItem<String>(
                                    child: Text(Quntity),
                                    value: Quntity,
                                  )).toList(),
                          onChanged: (val) => setState(() {
                            if (val == Quntity.first) {
                              this.selectedQuntity = selectedQuntity;
                            }
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // width:20 ,
                  // height: 30,
                  color: Color.fromARGB(255, 18, 18, 18),
                ),

              ]
              ),
        )
        ),
       
      ]
      ),
    );
  }
}
