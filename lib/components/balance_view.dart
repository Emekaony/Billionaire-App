import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';

class BalanceView extends StatelessWidget {
  final double balance;
  const BalanceView({super.key, required this.balance});

  String get balanceInUSD =>
      CurrencyFormatter.format(balance, CurrencyFormat.usd); // $ 1,910.93

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bank balance:"),
            SizedBox(height: 10),
            Text(
              balanceInUSD,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
