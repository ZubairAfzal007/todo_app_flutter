import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Message extends StatelessWidget {
  final String text;

  const Message({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/lottie/empty.json',
              height: 200, width: 200, fit: BoxFit.cover),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Colors.yellow
            )
          ),
        ],
      ),
    );
  }
}
