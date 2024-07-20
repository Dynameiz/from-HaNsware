import 'package:flutter/material.dart';
import 'package:from_hansware/components/credit.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 231),
      appBar: AppBar(
        title: Text("About", style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 70, 102, 70),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("From HaNsware", style: GoogleFonts.mulish(fontSize: 32, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20.0,),
            Image.asset("assets/logo.png", fit: BoxFit.cover, width: 200.0,),
            const SizedBox(height: 20.0,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text.rich(const TextSpan(
                  text:"Welcome to HaNsware, the premier app designed to simplify the buying and selling of wares in the Lands Between. Whether you're a seasoned adventurer or a new traveler, HaNsware offers a seamless shopping experience, connecting you with top-quality items and exclusive deals. Equip yourself for every challenge and discover unparalleled convenience with HaNsware." 
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
                style: GoogleFonts.mulish(),
              ),
            ),
            const SizedBox(height: 40.0,),
            const MyCredit(),
          ],
        ),
      ),
    );
  }
}