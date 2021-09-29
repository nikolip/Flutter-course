import 'package:flutter/material.dart';

import './result.dart';
import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'White', 'score': 0},
        {'text': 'Green', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answer': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Monkey', 'score': 0},
        {'text': 'Turtle', 'score': 5},
      ]
    },
    {
      'questionText': 'Who is the best?',
      'answer': [
        {'text': 'Niko', 'score': 10},
        {'text': 'Lipponen', 'score': 10},
        {'text': 'Johannes', 'score': 10},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
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
            : Result(_totalScore),
      ),
    );
  }
}
