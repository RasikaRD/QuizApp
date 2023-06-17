import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favorit color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 6},
        {'text': 'Red', 'score': 3},
        {'text': 'Pink', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your School?',
      'answers': [
        {'text': 'Tcc', 'score': 10},
        {'text': 'Roayal', 'score': 6},
        {'text': 'SPC', 'score': 3},
        {'text': 'KDU', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorit car?',
      'answers': [
        {'text': 'Nissan', 'score': 10},
        {'text': 'Toyota', 'score': 6},
        {'text': 'MG', 'score': 3},
        {'text': 'Mazda', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorit pet?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 6},
        {'text': 'Rat', 'score': 3},
        {'text': 'Rabit', 'score': 1},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have questions');
    } else {
      print('we don\'t have questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
