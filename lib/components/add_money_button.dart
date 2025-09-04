import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  const AddMoneyButton({this.handleButtonPressed, super.key});
  final void Function()? handleButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
      onPressed: handleButtonPressed,
      child: Icon(Icons.add, size: 32, fontWeight: FontWeight.bold),
    );
  }
}
