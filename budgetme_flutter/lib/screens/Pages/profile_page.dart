import 'package:budgetme_flutter/screens/Pages/editProfile_page.dart';
import 'package:budgetme_flutter/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/screens/Questions/q1_screen.dart';
import 'package:budgetme_flutter/main.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        backgroundColor: Colors.transparent, elevation: 0,
        leading: Navigator.of(context).canPop() ? null : IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
            },
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
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 10,
              right: 10,
              bottom: 10,
              child: ListView(
                physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 50,),
                    ProfileWidget(
                      imagePath: user.imagePath,
                      onClicked: () async {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()));
                      },
                    ),
                    const SizedBox(height: 30,),
                    buildName(user),
                    const SizedBox(height: 100,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          updateBudget(context, () {
                            Navigator.push(
                            context, MaterialPageRoute(builder: (context) => q1()));
                          }),
                          signOut(context, () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MyApp()));
                          }),
                        ],
                    ),
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
