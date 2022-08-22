import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalc(),
    ),
  );
}

class MyCalc extends StatefulWidget {
  const MyCalc({Key? key}) : super(key: key);
  @override
  State<MyCalc> createState() => _MyCalState();
}

class _MyCalState extends State<MyCalc> {
  var MyStyle = const TextStyle(
    fontSize: 35,
    color: Colors.white,
  );
  var MyStyle2 = const TextStyle(
    fontSize: 35,
    color: Color(0xffff5a66),
  );
  var a1 = [7, 8, 9, "*"];
  var a2 = [4, 5, 6, "-"];
  var a3 = [1, 2, 3, "+"];
  var a4 = ["00", 0, ".", "="];
  var input = 0;
  var input2 = 0;
  var opp = "0";
  var total = 0;
  var out = 0;
  var stop = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xff2e2d32),
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      (opp == "0")
                          ? "$input"
                          : (input2 == 0)
                          ? "$input $opp"
                          : "$input $opp $input2",
                      style: const TextStyle(
                        fontSize: 40,
                        color: Color(0xff8d8d8d),
                      ),
                    ),
                    (out == 1)
                        ? Text(
                      "$total",
                      style: const TextStyle(
                        fontSize: 60,
                        color: Color(0xffffffff),
                      ),
                    )
                        : const Text(""),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xff2e2d32),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              input = 0;
                              input2 = 0;
                              opp = "0";
                              out = 0;
                              stop = 0;
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 65,
                              width: 170,
                              alignment: Alignment.center,
                              child: const Text(
                                "AC",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xffff5a66),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              opp = "%";
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                "%",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Color(0xff929292),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              opp = "/";
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: Text(
                                "/",
                                style: MyStyle2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: a1.map((a) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (a == "*") {
                                    opp = "*";
                                  } else if (opp == "0") {
                                    if (a == 9) {
                                      input = (input * 10) + 9;
                                    } else if (a == 8) {
                                      input = (input * 10) + 8;
                                    } else if (a == 7) {
                                      input = (input * 10) + 7;
                                    }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (a == 9 && stop == 0) {
                                      input2 = (input2 * 10) + 9;
                                    } else if (a == 8 && stop == 0) {
                                      input2 = (input2 * 10) + 8;
                                    } else if (a == 7 && stop == 0) {
                                      input2 = (input2 * 10) + 7;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 100,
                                  width: 94,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$a",
                                    style: (a == "*") ? MyStyle2 : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: a2.map((a) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (a == "-") {
                                    opp = "-";
                                  } else if (opp == "0") {
                                    if (a == 6) {
                                      input = (input * 10) + 6;
                                    } else if (a == 5) {
                                      input = (input * 10) + 5;
                                    } else if (a == 4) {
                                      input = (input * 10) + 4;
                                    }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (a == 6 && stop == 0) {
                                      input2 = (input2 * 10) + 6;
                                    } else if (a == 5 && stop == 0) {
                                      input2 = (input2 * 10) + 5;
                                    } else if (a == 4 && stop == 0) {
                                      input2 = (input2 * 10) + 4;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 100,
                                  width: 94,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$a",
                                    style: (a == "-") ? MyStyle2 : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: a3.map((a) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (a == "+") {
                                    opp = "+";
                                  } else if (opp == "0") {
                                    if (a == 3) {
                                      input = (input * 10) + 3;
                                    } else if (a == 2) {
                                      input = (input * 10) + 2;
                                    } else if (a == 1) {
                                      input = (input * 10) + 1;
                                    }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (a == 3 && stop == 0) {
                                      input2 = (input2 * 10) + 3;
                                    } else if (a == 2 && stop == 0) {
                                      input2 = (input2 * 10) + 2;
                                    } else if (a == 1 && stop == 0) {
                                      input2 = (input2 * 10) + 1;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 100,
                                  width: 94,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$a",
                                    style: (a == "+") ? MyStyle2 : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: a4.map((a) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (opp == "0") {
                                    if (a == "00") {
                                      input = input * 100;
                                    } else if (a == 0) {
                                      input = input * 10;
                                    }

                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (a == "00" && stop == 0) {
                                      input2 = input2 * 100;
                                    } else if (a == 0 && stop == 0) {
                                      input2 = input2 * 10;
                                    }

                                  }
                                  if (a == "=") {
                                    stop = 1;
                                    out = 1;
                                    if (opp == "%") {
                                      total = input % input2;
                                    } else if (opp == "/") {
                                      total = input ~/ input2;
                                    } else if (opp == "*") {
                                      total = input * input2;
                                    } else if (opp == "-") {
                                      total = input - input2;
                                    } else if (opp == "+") {
                                      total = input + input2;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: (a == "=") ? 80 : 100,
                                  width: (a == "=") ? 80 : 100,
                                  alignment: Alignment.center,
                                  decoration: (a == "=")
                                      ? const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffff5a66),
                                  )
                                      : const BoxDecoration(),
                                  child: Text(
                                    "$a",
                                    style: (a == "=")
                                        ? const TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    )
                                        : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
