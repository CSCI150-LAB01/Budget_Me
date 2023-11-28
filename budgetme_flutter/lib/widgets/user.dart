import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';

class User{
  final String imagePath;
  final String userName;
  final String emailAddress;


  const User({
    required this.imagePath,
    required this.userName,
    required this.emailAddress,
  });
}

class UserPreferences{
  static const myUser= User(
    imagePath: 'https://i.redd.it/birhecrsd5u61.jpg',
    emailAddress: 'userEmail@gmail.com',
    userName: 'userName',
  );
}

Widget buildName(User user) => Column(
  children: [
    Text(
      user.userName,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    ),
    const SizedBox(height: 10,),
    Text(
      user.emailAddress,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),

    ),
  ],
);

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
    this.isEdit = false,
  }): super(key:key);

  @override
  Widget build(BuildContext context){
    final color = Theme.of(context).colorScheme.primary;
  
    return Center(
      child: Stack( 
        children:[
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(){
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 125,
          height: 125,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }
  
  Widget buildEditIcon(Color color) => buildCircle(
      color: Colors.white,
      all:3,
      child: buildCircle(
        color: color,
        all: 8,
        child: Icon(
          isEdit ? Icons.add_a_photo: Icons.edit,
          color: Colors.white,
          size: 15,
        ),
      ),
    ); 

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,

  }) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      child: child,
      color: color,
    ),
  );
}