import 'package:budgetme_flutter/screens/Pages/editProfile_page.dart';
import 'package:budgetme_flutter/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/screens/Questions/q1_screen.dart';
import 'package:budgetme_flutter/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  //space for stuffs
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MyApp())); // Navigate to the desired screen after sign out
    } catch (e) {
      // Handle any errors here
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    const userPic = UserPreferences.myUser;

    String? name;
    String? emailAddress;

    return Scaffold(
      /* 
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
        */
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
              top: 70,
              left: 10,
              right: 10,
              bottom: 10,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ProfileWidget(
                    imagePath: userPic.imagePath,
                    onClicked: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  /*
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance.collection('Users').doc(name).snapshots(),
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Text('No data available'); // Handle the case when there is no data
                      }
                    String userName = snapshot.data!['name'];
                    return Text('User Name: $userName',
                      style: TextStyle(fontSize: 24),
                    );
                    },
                  ),
                  
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance.collection('Users').doc(emailAddress).snapshots(),
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Text('No data available'); // Handle the case when there is no data
                      }
                    String emailAddress = snapshot.data!['email'];
                    return Text('Email Adress: $emailAddress',
                      style: TextStyle(fontSize: 24),
                    );
                    },
                  ),*/
                  buildName(userPic),
                  // Prints the userId value

                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        updateBudget(context, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const q1()));
                        }),
                        signOut(context, () {
                          _signOut(
                              context); // Call the sign-out function when the button is pressed
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
