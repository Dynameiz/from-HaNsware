import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  Function()? onTap;
  String btnText;

  MyButton({super.key, required this.onTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 24.0),
    //   child: ElevatedButton(
    //     onPressed: onClick,
    //     style: const ButtonStyle(
    //       backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(253, 216, 53, 1)),

    //     ),
    //     child: Text(btnText),
    //   ),
    // );
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