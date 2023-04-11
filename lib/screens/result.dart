import 'package:demo_app/screens/home.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetFun;

  Result({required this.resultScore, required this.resetFun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You are Scored',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text('${resultScore}',style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.restart_alt_rounded),
                  onPressed: resetFun,
                ),
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
