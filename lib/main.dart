import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var dice1 = 1;
  var dice2 = 1;
  var score1 = 0;
  var score2 = 0;
  var winner = "?";
  var round = 0;
  var player = false;

  bool gameStatus = true;
  void rollDice1() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
    });
  }

  void rollDice2() {
    setState(() {
      dice2 = Random().nextInt(6) + 1;
    });
  }

  void rolldice(int diceNum) {
    setState(() {
      if (diceNum == 1) {
        dice1 = Random().nextInt(6) + 1;
      } else {
        dice2 = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Dice Game",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "Winner : $winner",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "player 1",

                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Player 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          if (!player && gameStatus && round < 3) {
                            rolldice(1);
                            player = !player;
                          }
                        },
                        child: Image(
                          image: AssetImage('images/dice$dice1.png'),
                          color: player && gameStatus
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          if (player && (round < 3) && gameStatus) {
                            rolldice(2);
                            player = !player;

                            if (dice1 > dice2) {
                              score1++;
                            } else if (dice2 > dice1) {
                              score2++;
                            }
                            if (++round == 3) {
                              if (score1 > score2) {
                                winner = "Player1";
                              } else if (score2 > score1) {
                                winner = 'Player 2';
                              } else {
                                winner = "Draw";
                              }
                            }
                          }
                        },
                        child: Image(
                          image: AssetImage('images/dice$dice2.png'),
                          color: !player && gameStatus && round > 0
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '$score1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '$score2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  setState(() {
                    score1 = 0;
                    score2 = 0;
                    dice1 = 1;
                    dice2 = 1;
                    winner = "?";
                    gameStatus = !gameStatus;
                    round = 0;
                    player = false;
                  });
                },

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: gameStatus ? Colors.orange : Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    gameStatus ? 'Stop' : 'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
