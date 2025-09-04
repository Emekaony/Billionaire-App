import 'package:flutter/foundation.dart';
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
  double balance = 500.0;

  void addMoney() {
    setState(() {
      balance += 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: Text("Billionaire App")),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey[700],
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bank balance:"),
                      SizedBox(height: 10),
                      Text("\$$balance"),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    minimumSize: Size(double.infinity, 0),
                  ),
                  onPressed: addMoney,
                  child: Text("Click me!"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
