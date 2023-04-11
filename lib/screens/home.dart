import 'package:demo_app/screens/quiz-screen.dart';
import 'package:demo_app/screens/signin.dart';
import 'package:demo_app/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: Text('Home',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
        ),
        actions: <Widget>[
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder:(context)=> SignInScreen()));
            });
          }, icon: Icon(Icons.logout_rounded),)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Quiz()));
              },
                child: Text('Start Quiz',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
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
            ),
          ),
        ]
      ),
    );
  }
}
