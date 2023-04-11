import 'package:flutter/material.dart';
import 'dart:ui';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(onPressed: selectHandler, child: Text(answerText,style:
      TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return Colors.purpleAccent;
            },
          ),
        ),
      ),
    );
  }
}
