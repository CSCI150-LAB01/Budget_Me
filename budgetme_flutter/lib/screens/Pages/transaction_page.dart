import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
        child: Stack(
          children: [
            // Top grey box
            Positioned(
              top: 50, // Adjust as needed
              left: 20,
              right: 20,
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.4, // 40% of the screen height
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // Grey with opacity
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(500),
                    topRight: Radius.circular(500),
                    bottomLeft: Radius.circular(500), // Adjust as needed
                    bottomRight: Radius.circular(500), // Adjust as needed
                  ),
                ),
                // Add child content inside this container as needed
              ),
            ),
            // Bottom grey box
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5, // Adjust as needed
              left: 0,
              right: 0,
              bottom: 80,
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.45, // Remaining height of the screen
                width: MediaQuery.of(context).size.width * .35,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20), // Adjust as needed
                    bottomRight: Radius.circular(20),
                  ),
                  // Grey with opacity
                  // Add border radius if needed
                ),
                // Add child content inside this container as needed
              ),
            ),
            // Add more Positioned widgets as needed
          ],
        ),
      ),
    );
  }
}
