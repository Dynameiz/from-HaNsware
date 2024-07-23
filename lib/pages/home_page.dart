import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:from_hansware/components/image_carousel.dart';
import 'package:from_hansware/components/img_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center( 
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            const MyCarousel(),
            const SizedBox(height: 10.0,),
            const Divider(indent: 10.0, endIndent: 10.0,),
            const SizedBox(height: 10.0,),
            Text("Wares for sale!", style: GoogleFonts.mulish(fontSize: 24, fontWeight: FontWeight.w600),),
            const SizedBox(height: 20.0,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyImgButton(imgPath: "assets/weapon.png", desc: "Weapons"),
                SizedBox(width: 15.0,),
                MyImgButton(imgPath: "assets/armor.png", desc: "Armors"),
                SizedBox(width: 15.0,),
                MyImgButton(imgPath: "assets/spell.png", desc: "Spells"),
                SizedBox(width: 15.0,),
                MyImgButton(imgPath: "assets/crafting.png", desc: "Crafting"),
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(indent: 10.0, endIndent: 10.0,),
            const SizedBox(height: 10,),
            Text("HaNsware", style: GoogleFonts.mulish(fontSize: 20, fontWeight: FontWeight.w600),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text.rich(const TextSpan(
                  text:"HaNsware is your go-to app for easily buying and selling wares in the Lands Between. Discover a seamless shopping experience designed for adventurers." 
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
                style: GoogleFonts.mulish(),
              ),
            ),
            const SizedBox(height: 30,),
            Text("\"Equip, Trade, Triumph in the Lands Between\"", style: GoogleFonts.mulish(fontStyle: FontStyle.italic),),
          ],
        )
      ),
    );
  }
}