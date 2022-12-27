// ignore_for_file: sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:fresh/fruit_controler.dart';

import '../model/datamodel.dart';
import 'fruitPage.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  FruitControler controler = FruitControler();
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementtCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 252, 252),
      appBar: AppBar(
        title: const Text(
          "My Cart ",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
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
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Color.fromARGB(255, 15, 15, 15),
            )),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: controler.selectedFruit.length,
          itemBuilder: (BuildContext context, index) {
            return CounterItem(
              model: controler.selectedFruit[index],
            );
          }),
    );
  }
}

class CounterItem extends StatefulWidget {
  final FritCatigoodel model;
  const CounterItem({super.key, required this.model});

  @override
  State<CounterItem> createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 245, 239, 239),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.6ac1dddbaaf8a6abba2330a14d2b6ff7?rik=YjLr8B6i8GMwEA&riu=http%3a%2f%2fpngimagesfree.com%2fFruit%2fApple%2fApple-png-transparent-image.png&ehk=icSgVeUpmzhw8nN4Zd1L%2bNTx1an5cRRw4MCXF8oziqM%3d&risl=&pid=ImgRaw&r=0"))),
          ),
          const SizedBox(
            width: 64,
          ),
          Center(
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 13, 45, 5),
                  borderRadius: BorderRadius.circular(4)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Center(
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Center(
            child: Container(
              alignment: Alignment.centerRight,
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 3, 43),
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove,
                          size: 15, color: Colors.white))),
            ),
          ),
          Spacer(),
          Center(
            child: Text(
              widget.model.price.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
