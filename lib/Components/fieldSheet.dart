import 'package:flutter/material.dart';
import 'package:todoapp/Components/Button.dart';

class FieldResponse extends StatelessWidget {
  const FieldResponse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(22.0),
          topLeft: Radius.circular(22.0),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Enter Some todos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:25.0
              ),
            ),
          ),
          Button(
            text: 'OK',
            handleSubmit: () {
              Navigator.pop(context);
            },
            iconData: Icons.add,
          ),
        ],
      ),
    );
  }
}
