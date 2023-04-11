import 'package:demo_app/reusable_widget/reusable_widget.dart';
import 'package:demo_app/screens/home.dart';
import 'package:demo_app/screens/signup.dart';
import 'package:demo_app/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextCotroller = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2893"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),],
            begin: Alignment.topCenter,end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.1, 28, 8),
            child: Column(
              children: <Widget>[
                logoWidget('assets/images/quiz-badge.png'),
                SizedBox(
                  height: 5.0,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 30.0,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextCotroller),
                SizedBox(
                  height: 30.0,
                ),
                signInAndSignUpButton(context, true, (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextCotroller.text).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }).onError((error, stackTrace) {
                    print(error.toString());
                  });
                }),
                SizedBox(
                  height: 30.0,
                ),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have Account? ",style: TextStyle(color: Colors.white70),),
        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text(' Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
        ),
      ],
    );
  }
}