import 'package:flutter/material.dart';

class UpdateIncomePage extends StatefulWidget {
  const UpdateIncomePage({Key? key}) : super(key: key);

  @override
  _UpdateIncomePage createState() => _UpdateIncomePage();
}

class _UpdateIncomePage extends State<UpdateIncomePage> {
  //space for stuffs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Update Income',
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
      ),
    );
  }
}