import 'package:demo_app/screens/quiz-question.dart';
import 'package:demo_app/screens/result.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _questionIndex = 0;
  static const _quizies = [
    {
      'question': "What\'s your favorite color?",
      'options':[{'text':'Red','score':5},{'text':'Black','score':3},{'text':'Orange','score':1},{'text':'White','score':10}],
    },
    {
      'question': 'What\'s your favorite Movie?',
      'options':[{'text':'Resident Evil','score':10},{'text':'Saw','score':5},{'text':'IT','score':3},{'text':'Silenced','score':1}],
    },
    {
      'question': 'What\'s your favorite Song?',
      'options':[{'text':'Calm Down','score':5},{'text':'Dandilions','score':8},{'text':'Blinding Lights','score':5},{'text':'Heat Waves','score':10}],
    }
  ];
  var totalScore = 0;
  void _selectAnswer(int score){
    totalScore = totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _quizies.length){
      print("More questions to ask");
    }else{
      print("No more questions to ask");
    }
  }
  void reset(){
    setState(() {
      totalScore = 0;
      _questionIndex = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
            backgroundColor: Colors.purple,
          ),
          body: SingleChildScrollView(
            child: (_questionIndex < _quizies.length)
                ? QuizQuestion(questions: _quizies, questionIndex: _questionIndex, answers: _selectAnswer)
                :Result(resultScore: totalScore,resetFun: reset),
          )
      ),
    );
  }
}
