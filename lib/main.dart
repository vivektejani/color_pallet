import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorPalette(),
    ),
  );
}

class ColorPalette extends StatefulWidget {
  const ColorPalette({Key? key}) : super(key: key);

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  var MyStyle = const TextStyle(
    color: Color(0xff3bb3f9),
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  Random r1 = Random();
  List colors = [
    Colors.blue,
    Colors.pink,
    Colors.indigo,
    Colors.red,
    Colors.grey,
    Colors.amber,
    Colors.orange,
    Colors.black,
    Colors.purple,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.blueGrey,
    Colors.black12,
    Colors.teal,
    Colors.yellowAccent,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xffffffff),
                Color(0xffd8e6f4),
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                "Color Palette\n   Generator",
                style: MyStyle,
              ),
              const SizedBox(height: 70),
              Container(
                height: 450,
                width: 130,
                child: Column(
                  children: List.generate(
                    6,
                        (index) => Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        color: colors[r1.nextInt(16)],
                        borderRadius: radiusFinder(index),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: const Color(0xff3bb3f9), width: 3),
                  ),
                  child: Text(
                    "Generate",
                    style: MyStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  radiusFinder(int n) {
    if (n == 0) {
      return const BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20));
    } else if (n == 5) {
      return const BorderRadius.only(
          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20));
    } else {
      BorderRadius.circular(0);
    }
  }
}
