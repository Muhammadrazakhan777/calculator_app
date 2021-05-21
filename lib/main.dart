import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum;
  int secondnum;
  String textToDisplay = '';
  String result;
  String operatorToPerform;
  void buttonClicked(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstnum = int.parse(textToDisplay);
      result = '';
      operatorToPerform = btnVal;
    } else if (btnVal == '=') {
      secondnum = int.parse(textToDisplay);
      if (operatorToPerform == '+') {
        result = (firstnum + secondnum).toString();
      }
      if (operatorToPerform == 'x') {
        result = (firstnum * secondnum).toString();
      }
      if (operatorToPerform == '-') {
        result = (firstnum - secondnum).toString();
      }
      if (operatorToPerform == '/') {
        result = (firstnum / secondnum).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButton(String btnVal) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonClicked(btnVal),
        child: Text(
          '$btnVal',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                '$textToDisplay',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            )),
            Row(
              children: [
                customButton('9'),
                customButton('8'),
                customButton('7'),
                customButton('+'),
              ],
            ),
            Row(
              children: [
                customButton('6'),
                customButton('5'),
                customButton('4'),
                customButton('-'),
              ],
            ),
            Row(
              children: [
                customButton('3'),
                customButton('2'),
                customButton('1'),
                customButton('x'),
              ],
            ),
            Row(
              children: [
                customButton('C'),
                customButton('0'),
                customButton('='),
                customButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
