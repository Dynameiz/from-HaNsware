import 'package:flutter/material.dart';
import 'package:from_hansware/components/wares_card.dart';
import 'package:from_hansware/models/my_wares.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  bool showWeapons = true;
  bool showArmors = true;
  bool showSpells = true;
  bool showCrafting = true;

  static const List<String> categories = <String>[
    "All",
    "Weapons",
    "Armors",
    "Spells",
    "Crafting"
  ];

  String selectedCategory = categories.first;

  void viewAllItems() {
    showWeapons = true;
    showArmors = true;
    showSpells = true;
    showCrafting = true;
  }
  void viewWeapons() {
    showWeapons = true;
    showArmors = false;
    showSpells = false;
    showCrafting = false;
  }
  void viewArmors() {
    showWeapons = false;
    showArmors = true;
    showSpells = false;
    showCrafting = false;
  }
  void viewSpells() {
    showWeapons = false;
    showArmors = false;
    showSpells = true;
    showCrafting = false;
  }
  void viewCrafting() {
    showWeapons = false;
    showArmors = false;
    showSpells = false;
    showCrafting = true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0,),
          DropdownMenu<String>(
            initialSelection: categories.first,
            width: MediaQuery.of(context).size.width - 24,
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 225, 225, 225))),
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 200, 200, 200))),
              suffixStyle: GoogleFonts.mulish(fontSize: 16),
            ),
            textStyle: GoogleFonts.mulish(
              fontSize: 16,
            ),
            onSelected: (String? value){
              setState(() {
                selectedCategory = value!;
              });
            },
            dropdownMenuEntries: categories.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList()
          ),
          const SizedBox(height: 10.0,),
          const Divider(indent: 10, endIndent: 10,),
          const SizedBox(height: 10.0,),
          Expanded(
            child: _buildAllWares(),
          ),
          
        ],
      ),
    );
  }
  
  

  _buildAllWares() => GridView.builder(
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: ((MediaQuery.of(context).size.height / 4).toDouble() / (MediaQuery.of(context).size.height / 2.8).toDouble()),
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyWares.dummyWares.length,
    itemBuilder: (context, index) {
      final allWares = MyWares.dummyWares[index];
      return WaresCard(wares: allWares,);
    },

  );
}
