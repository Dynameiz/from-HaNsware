import 'package:flutter/material.dart';

class MyPasswordField extends StatelessWidget {
  String textHint;
  TextEditingController textController = TextEditingController();

  MyPasswordField({super.key, required this.textHint});

  bool isValid(){
    if(textController.text.isEmpty){
      return false;
    }
    // Database checking
    // if(...){

    // }
    return true;

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 225, 225, 225))),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 200, 200, 200))),
          fillColor: const Color.fromARGB(240, 255, 255, 255),
          filled: true,
          hintText: textHint,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        controller: textController,
        obscureText: true,
        autocorrect: false,
      ),
    );
  }
}