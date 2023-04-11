import 'package:demo_app/screens/home.dart';
import 'package:demo_app/screens/signin.dart';
import 'package:demo_app/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/reusable_widget/reusable_widget.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Sign Up',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
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
            padding: const EdgeInsets.fromLTRB(20,120,20,0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false, _usernameTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.lock_outline, true, _passwordTextcontroller),
                SizedBox(
                  height: 20,
                ),
                signInAndSignUpButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextcontroller.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                  }).onError((error, stackTrace) {
                    print("Error: Unable to create account \n ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
