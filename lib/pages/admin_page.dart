import 'package:flutter/material.dart';
import 'package:from_hansware/components/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  final MyTextField nameTF = MyTextField(textHint: "Name");
  final MyTextField rarityTF = MyTextField(textHint: "Rarity");
  final MyTextField categoryTF = MyTextField(textHint: "Category");
  final MyTextField typeTF = MyTextField(textHint: "Type");
  final MyTextField imageTF = MyTextField(textHint: "Image");
  final MyTextField detailTF = MyTextField(textHint: "Detail");
  final MyTextField priceTF = MyTextField(textHint: "Price");
  final MyTextField quantityTF = MyTextField(textHint: "Quantity");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Page",
          style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Insert New Wares"),
              const SizedBox(height: 20,),
              nameTF,
              const SizedBox(height: 20,),
              rarityTF,
              const SizedBox(height: 20,),
              categoryTF,
              const SizedBox(height: 20,),
              typeTF,
              const SizedBox(height: 20,),
              imageTF,
              const SizedBox(height: 20,),
              detailTF,
              const SizedBox(height: 20,),
              priceTF,
              const SizedBox(height: 20,),
              quantityTF,

              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () =>{
                if(nameTF.getText().isEmpty || rarityTF.getText().isEmpty || categoryTF.getText().isEmpty || typeTF.getText().isEmpty || imageTF.getText().isEmpty || detailTF.getText().isEmpty || priceTF.getText().isEmpty || quantityTF.getText().isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields must be filled!"))
                  )
                }
                else{



                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data sucessfully added"))
                  )
                }
              }, child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}