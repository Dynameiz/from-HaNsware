import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String username;
  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HaNsware"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Welcome, " + username),
          ],
        ),
      ),
    );
  }
}