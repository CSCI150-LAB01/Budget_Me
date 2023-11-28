import 'package:budgetme_flutter/screens/home_screen.dart';
import 'package:budgetme_flutter/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:flutter/cupertino.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  final icon = CupertinoIcons.clear_circled;
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Update Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
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
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 100,
              ),
              ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {}),
              const SizedBox(
                height: 24,
              ),
              TextFieldWidget(
                label: 'Update Full Name',
                text: user.userName,
                onChanged: (userName) {},
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                label: 'Update Email',
                text: user.emailAddress,
                onChanged: (emailAddress) {},
              ),
            ],
          ),
        ),
      );
}
