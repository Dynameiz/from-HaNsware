import 'package:flutter/material.dart';
import 'package:from_hansware/models/wares.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WaresCard extends StatefulWidget {

  final Wares wares;

  const WaresCard({super.key, required this.wares});

  @override
  State<WaresCard> createState() => _WaresCardState();
}

class _WaresCardState extends State<WaresCard> {

  NumberFormat formatter = NumberFormat.decimalPatternDigits(
    locale: 'pt',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.wares.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
          const Divider(),
          const SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.wares.name,
                style: GoogleFonts.mulish(fontSize: 16),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.wares.category} / ${widget.wares.type}',
                style: GoogleFonts.mulish(color: Colors.grey),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/runes.png', height: 32,),
              Text(
                formatter.format(widget.wares.price),
                style: GoogleFonts.mulish(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}