import 'package:flutter/material.dart';
import 'package:flutter_new_app/quiz.dart';
import 'package:flutter_new_app/result.dart';


void main() => runApp(MyApp());

  class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    var _questionIndex = 0;
    var _totalScore = 0;

    final questions = [
      {'questionText': 'What\'s your favorite color?',
        'answers': [
              {'text': 'Black', 'score': 10 },
              {'text': 'Red', 'score': 5},
              {'text': 'Green', 'score': 3},
              {'text': 'White', 'score': 1},
        ],
      },
      {'questionText': 'What\'s your favorite animal?',
        'answers': [
              {'text': 'Rabbit', 'score': 3},
              {'text': 'Snake', 'score': 11},
              {'text': 'Elephant', 'score': 5},
              {'text': 'Lion', 'score': 9},
        ],
      },
      {'questionText': 'Who\'s your favorite instructor?',
        'answers': [
              {'text': 'Max', 'score': 11},
              {'text': 'Code', 'score': 3},
              {'text': 'Java', 'score': 5},
              {'text': 'Android', 'score': 9},
        ],
      },
    ];

    void _resetQuiz(){
        setState(() {
          _questionIndex = 0;
          _totalScore = 0;
        });

    }

     void _answerQuestion(int score){
      _totalScore = _totalScore + score;

      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex.toString());
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My First App'),),
          body: _questionIndex < questions.length
              ? Quiz(
                  questions: questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz),
      ),
      );
    }
}