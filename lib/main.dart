import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Cuál es tu color favorito?',
      'answers': [
        {'text': 'Negro', 'score': 10},
        {'text': 'Blue', 'score': 20},
        {'text': 'Verde', 'score': 15},
        {'text': 'Blanco', 'score': 1}
      ]
    },
    {
      'questionText': 'Cuál es tu mascota favorita?',
      'answers': [
        {'text': 'Leon', 'score': 10},
        {'text': 'Perro', 'score': 20},
        {'text': 'Gato', 'score': 15},
        {'text': 'Oso', 'score': 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {

    _totalScore += score;
    
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('hay mas preguntas');
    } else {
      print('No mas preguntas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My fist App Answers'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(),
      ),
    );
  }
}
