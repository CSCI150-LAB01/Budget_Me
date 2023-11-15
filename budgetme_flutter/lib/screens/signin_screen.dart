import 'package:budgetme_flutter/screens/home_screen.dart';
import 'package:budgetme_flutter/screens/signup_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/forgotpassword_screen.dart';
import 'package:budgetme_flutter/screens/forgotusername_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/budget-logo.png"),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Password", Icons.lock, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    print("Signed In");
                  }).onError((error, stackTrace) {
                    //Show user some error
                  });
                }),
                signUpOption(),
                forgotUsernameOption(),
                forgotPasswordOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row forgotUsernameOption() {
    return Row(
        //figure out alignment
        children: [
          const Text("Forgot Your Username?",
              style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotUsernameScreen()));
            }, // on Tap
            child: const Text(
              "  Find Username",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }

  Row forgotPasswordOption() {
    return Row(
        //figure out alignment
        children: [
          const Text("Forgot Your Password?",
              style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen()));
            }, // on Tap
            child: const Text(
              "  Find Password",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }

  Row signUpOption() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
