import 'package:flutter/material.dart';
import 'package:from_hansware/login.dart';

void main(List<String> args) {
  runApp(const HaNsware());
}

class HaNsware extends StatelessWidget {
  const HaNsware({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "HaNsware",
      home: LoginPage(),
    );
  }
}

