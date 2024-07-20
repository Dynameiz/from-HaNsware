import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyImgButton extends StatelessWidget {
  final String imgPath;
  final String desc;

  const MyImgButton({super.key, required this.imgPath, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(

          child: Container(
            height: 80.0,
            width: 80.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(imgPath),
          ),
        ),
        Text(desc, style: GoogleFonts.mulish(),),
      ],
    );
  }
}