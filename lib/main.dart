import "package:billionaire_app/components/balance_view.dart";
import "package:billionaire_app/components/reduce_money.dart";
import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";
import "package:billionaire_app/components/add_money_button.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 144000;

  void addMoney() async {
    if (balance < 10000) {
      setState(() {
        balance += 500;
      });
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("balance", balance);
  }

  void reduceMoney() async {
    if (balance > 500) {
      setState(() {
        balance -= 500;
      });
    }
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
              BalanceView(balance: balance),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    // You use an expanded inside another expanded
                    // we learn everyday!
                    Expanded(
                      child: ReduceMoneyButton(
                        handleButtonPressed: reduceMoney,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: AddMoneyButton(handleButtonPressed: addMoney),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
