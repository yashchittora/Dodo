import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttontext;
  // VoidCallback onSave;
  // VoidCallback onCancel;
  final VoidCallback onPressed;

  
  const MyButton({
    super.key,
    required this.buttontext,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber[100],
        ),
        child: Text(buttontext,
        style: const TextStyle(color: Colors.black),),),
    );
  }
}