import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftbuttonnumber = 1;
  var rightbuttonnumber = 1;
  String num = "Press Start";

  void randomnumber() {
    setState(() {
      leftbuttonnumber = Random().nextInt(5) + 1;
      rightbuttonnumber = Random().nextInt(5) + 1;

      if (leftbuttonnumber == rightbuttonnumber) {
        num = "<-- Draw Match -->";
      } else if (leftbuttonnumber > rightbuttonnumber) {
        num = "<-- Player 1 Win";
      } else {
        num = "Player 2 Win -->";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '$num',
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$leftbuttonnumber.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$rightbuttonnumber.png'),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    "Player 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Player 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: OutlinedButton(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Start'),
            ),
            onPressed: () {
              randomnumber();
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 4, color: Colors.white),
              primary: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
