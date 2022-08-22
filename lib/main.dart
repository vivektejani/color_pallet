import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GstCal(),
    ),
  );
}

class GstCal extends StatefulWidget {
  const GstCal({Key? key}) : super(key: key);

  @override
  State<GstCal> createState() => _GstState();
}

class _GstState extends State<GstCal> {
  var Con1 = 0;
  var Con2 = 0;
  var Con3 = 0;
  var Con4 = 0;
  var Con5 = 0;
  var Val = 0;
  var prs = 0;
  var GST = 0;
  var MyStyle = const TextStyle(fontSize: 30);
  var input = 0;
  var finalPrice = 0;
  var a1 = [7, 4, 1, "00"];
  var a2 = [8, 5, 2, 0];
  var a3 = [9, 6, 3, "."];
  var pr = ["3%", "5%", "12%", "18%", "28%"];
  var Decor = BoxDecoration(
    color: Colors.deepOrange,
    borderRadius: BorderRadius.circular(30),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 35,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ORIGINAL PRICE",
                          style: TextStyle(fontSize: 19),
                        ),
                        const SizedBox(width: 25),
                        Container(
                          width: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "$input Rs.",
                            style: const TextStyle(fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 80,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height: 40),
                            Text(
                              "GST",
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pr.map((a) {
                            return InkWell(
                              // splashColor: Colors.deepOrange,
                              onTap: () {
                                setState(() {
                                  if (a == "3%") {
                                    prs = 3;
                                    finalPrice = (input * 3 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    Con1 = 1;
                                    Con2 = 0;
                                    Con3 = 0;
                                    Con4 = 0;
                                    Con5 = 0;
                                  } else if (a == "5%") {
                                    finalPrice = (input * 5 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 5;
                                    Con2 = 1;
                                    Con1 = 0;
                                    Con3 = 0;
                                    Con4 = 0;
                                    Con5 = 0;
                                  } else if (a == "12%") {
                                    finalPrice = (input * 12 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 12;
                                    Con3 = 1;
                                    Con1 = 0;
                                    Con2 = 0;
                                    Con4 = 0;
                                    Con5 = 0;
                                  } else if (a == "18%") {
                                    finalPrice = (input * 18 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 18;
                                    Con4 = 1;
                                    Con1 = 0;
                                    Con2 = 0;
                                    Con3 = 0;
                                    Con4 = 0;
                                  } else if (a == "28%") {
                                    finalPrice = (input * 28 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 28;
                                    Con5 = 1;
                                    Con1 = 0;
                                    Con2 = 0;
                                    Con3 = 0;
                                    Con4 = 0;
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  width: 75,
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Text(
                                    a,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  decoration: (a == "3%" && Con1 == 1)
                                      ? Decor
                                      : (a == "5%" && Con2 == 1)
                                      ? Decor
                                      : (a == "12%" && Con3 == 1)
                                      ? Decor
                                      : (a == "18%" && Con4 == 1)
                                      ? Decor
                                      : (a == "28%" && Con5 == 1)
                                      ? Decor
                                      : BoxDecoration(),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 35,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "FINAL PRICE",
                          style: TextStyle(fontSize: 19),
                        ),
                        const SizedBox(width: 90),
                        Text(
                          "$finalPrice",
                          style: const TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 80,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "CGST/SGST",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          "$GST",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Expanded(
              flex: 55,
              child: Row(
                children: [
                  Column(
                    children: a1.map((e) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (e == 7) {
                              input = (input * 10) + 7;
                            } else if (e == 4) {
                              input = (input * 10) + 4;
                            } else if (e == 1) {
                              input = (input * 10) + 1;
                            } else if (e == "00") {
                              input = input * 100;
                            }
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 105,
                            color: Colors.white,
                            child: Text(
                              "$e",
                              style: MyStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: a2.map((e) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (e == 8) {
                              input = (input * 10) + 8;
                            } else if (e == 5) {
                              input = (input * 10) + 5;
                            } else if (e == 2) {
                              input = (input * 10) + 2;
                            } else if (e == 0) {
                              input = input * 10;
                            }
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 105,
                            color: Colors.white,
                            child: Text(
                              "$e",
                              style: MyStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: a3.map((e) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (e == 9) {
                              input = (input * 10) + 9;
                            } else if (e == 6) {
                              input = (input * 10) + 6;
                            } else if (e == 3) {
                              input = (input * 10) + 3;
                            }
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 105,
                            color: Colors.white,
                            child: Text(
                              "$e",
                              style: MyStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            finalPrice = 0;
                            GST = 0;
                            input = 0;
                            prs = 0;
                            Con1 = 0;
                            Con2 = 0;
                            Con3 = 0;
                            Con4 = 0;
                            Con5 = 0;
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "AC",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            height: 200,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          setState(() {
                            input = input ~/ 10;
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "⌫",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            height: 200,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
