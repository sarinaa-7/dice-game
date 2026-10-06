import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          elevation: 5,
          shadowColor: Colors.orange,
          title: Text(
            'Dice Game',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Winner : ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight(1000),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Player 1',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight(1000),
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      'Player 2',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight(1000),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: AssetImage('images/dice1.png')),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: AssetImage('images/dice1.png')),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
