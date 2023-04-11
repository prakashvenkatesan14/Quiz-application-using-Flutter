import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(
      {required this.questionText}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Text(questionText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
      ),
    );
  }
}
