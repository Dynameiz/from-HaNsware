import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("This is Item Page", style: GoogleFonts.poppins(),),
    );
  }
}