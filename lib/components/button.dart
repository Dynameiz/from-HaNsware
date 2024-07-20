import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final String btnText;

  const MyButton({super.key, required this.onTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14.0),
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 200, 37),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      )
    );
  }
}