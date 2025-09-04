import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  const AddMoneyButton({this.handleButtonPressed, super.key});
  final void Function()? handleButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[700],
        minimumSize: Size(double.infinity, 0),
      ),
      onPressed: handleButtonPressed,
      child: Text("Click me!"),
    );
  }
}
