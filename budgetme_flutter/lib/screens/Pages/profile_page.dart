import 'package:budgetme_flutter/screens/Pages/editProfile_page.dart';
import 'package:budgetme_flutter/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/screens/Questions/q1_screen.dart';

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
            const SizedBox(
              height: 50,
            ),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            const SizedBox(
              height: 30,
            ),
            buildName(user),
            updateButton(context, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => q1()));
            }),
          ],
        ),
      ),
    );
  }
}
