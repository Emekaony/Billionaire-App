import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0.0;

  void addMoney() async {
    setState(() {
      balance += 500;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("balance", balance);
  }

  void loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? updatedBalance = prefs.getDouble("balance");
    if (updatedBalance != null) {
      setState(() {
        balance = updatedBalance;
      });
    }
  }

  @override
  void initState() {
    // do this soon as the app loads!
    loadBalance();
    super.initState();
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
