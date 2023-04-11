import 'package:demo_app/screens/answer.dart';
import 'package:demo_app/screens/question.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answers;

  QuizQuestion({required this.questions, required this.questionIndex, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionText: questions[questionIndex]['question'].toString()),
        ...(questions[questionIndex]['options'] as List<Map<String,Object>>).map((answer){
          return Answer(() => answers(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
