import 'package:budgetme_flutter/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/screens/home_screen.dart';
import 'package:budgetme_flutter/widgets/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  //space for stuffs

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),

      
      child: ListView(
        physics: BouncingScrollPhysics(),
     
        children: [
          const SizedBox(height: 50,),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 30,),
          buildName(user),

        ],
      ),


      /*
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
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              textBox2("1 of 10 Questions"),
              const SizedBox(
                height: 40,
              ), //Buffer spaces
             
              const Text(
                "What's your monthly income?",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white.withOpacity(0.9)),
                decoration: InputDecoration(
                  labelText: 'Nearest Whole Number',
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ), //Buffer spaces
              const SizedBox(
                height: 320,
              ),
              confirmButton(context, () {
                const Alignment(1, -1);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>HomeScreen()));
              }) //confirm button
            ]),
          ),
        ),
      ),
      */
      ),
    );
  }
}

