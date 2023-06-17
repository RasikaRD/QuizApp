import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  void Function()? resetHandler;

  Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore >= 35) {
      resultText = 'You are too good! Congratz!';
    } else if (resultScore >= 25 && resultScore < 35) {
      resultText = 'You are good and try to do more!';
    } else if (resultScore >= 15 && resultScore < 25) {
      resultText = 'You are bad!';
    } else {
      resultText = 'You are too bad! Come in next time.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: resetHandler,
            child: const Text('Restart the Quize'),
          )
        ],
      ),
    );
  }
}
