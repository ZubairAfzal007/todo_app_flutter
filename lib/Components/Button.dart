import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback handleSubmit;
  final IconData iconData;
  final String text;

  Button(
      {required this.handleSubmit, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.yellow),
          onPressed: handleSubmit,
          child: text.isEmpty
              ? Icon(
                  iconData,
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
