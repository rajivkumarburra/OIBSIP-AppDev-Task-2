import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../calculation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String display = "";
  String answer = "";
  String operand = "";
  bool isPressed = false;

  Widget createButton(String text) {
    return MaterialButton(
      onPressed: text == "C"
          ? () {
              setState(() {
                display = "";
                answer = "";
                operand = "";
                isPressed = false;
              });
            }
          : text == "D"
              ? () {
                  setState(() {
                    display = display.substring(0, display.length - 1);
                  });
                }
              : "+-X÷".contains(text)
                  ? () {
                      setState(() {
                        operand += display;
                        operand += text;
                        display = "";
                      });
                    }
                  : text == "="
                      ? isPressed
                          ? () {}
                          : () {
                              setState(() {
                                operand += display;
                                answer = Calculation.calculateResult(operand);
                                display = answer;
                                isPressed = true;
                              });
                            }
                      : () {
                          setState(() {
                            display += text;
                          });
                        },
      elevation: 0,
      color: "0123456789".contains(text) ? Colors.blueGrey : Colors.teal,
      padding: const EdgeInsets.all(35),
      shape: const CircleBorder(),
      child: text == "D"
          ? const Icon(
              Icons.keyboard_backspace_outlined,
              size: 20,
            )
          : text == "X"
              ? const Icon(Icons.close)
              : text == "+"
                  ? const Icon(Icons.add)
                  : text == "-"
                      ? const Icon(Icons.remove)
                      : text == "C"
                          ? const Icon(Mdi.alphaCCircleOutline)
                          : Text(
                              text,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, right: 20),
              color: Colors.blueGrey,
              height: 180,
              alignment: Alignment.centerRight,
              child: Text(
                display,
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("C"),
                createButton("+"),
                createButton("-"),
                createButton("D"),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("7"),
                createButton("8"),
                createButton("9"),
                createButton("÷"),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("4"),
                createButton("5"),
                createButton("6"),
                createButton("X"),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("1"),
                createButton("2"),
                createButton("3"),
                createButton("."),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("0"),
                createButton("("),
                createButton(")"),
                createButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
