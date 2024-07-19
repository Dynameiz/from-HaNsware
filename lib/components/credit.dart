import 'package:flutter/material.dart';

class MyCredit extends StatelessWidget {
  const MyCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // HN Logo
          Image.asset("./assets/hn_logo.png", fit: BoxFit.cover, width: 32.0,),
          // Made by LB010
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Made by"),
                Text("LB010", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
              ],
            ),
          )
        ],
      ),
    );
  }
}