import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String textHint;
  TextEditingController textController = TextEditingController();

  MyTextField({super.key, required this.textHint});

  String getText(){
    return textController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 225, 225, 225))),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 200, 200, 200))),
          hintText: textHint,
          hintStyle: TextStyle(color: Colors.grey[500]),
          fillColor: const Color.fromARGB(240, 255, 255, 255),
          filled: true,
        ),
      
      ),
    );
  }
}