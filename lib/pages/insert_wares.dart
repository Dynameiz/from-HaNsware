import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:from_hansware/components/text_field.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class InsertWares extends StatefulWidget {
  const InsertWares({super.key});

  @override
  State<InsertWares> createState() => _InsertWaresState();
}

class _InsertWaresState extends State<InsertWares> {

  var bgColorLight = const Color.fromARGB(255, 247, 244, 231);
  var bgColorLightFocused = const Color.fromARGB(249, 240, 223, 175);
  var bgColorDark = const Color.fromARGB(255, 49, 65, 60);

  File? _image;
  final _imagePicker = ImagePicker();

  final MyTextField nameTF = MyTextField(textHint: "Name");
  final MyTextField rarityTF = MyTextField(textHint: "Rarity");
  final MyTextField categoryTF = MyTextField(textHint: "Category");
  final MyTextField typeTF = MyTextField(textHint: "Type");
  final MyTextField detailTF = MyTextField(textHint: "Detail");
  final MyTextField priceTF = MyTextField(textHint: "Price");
  final MyTextField quantityTF = MyTextField(textHint: "Quantity");

  Future _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if(pickedFile == null){
      return;
    }
    var croppedImageFile = await ImageCropper.platform.cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1)
    );

    if(croppedImageFile == null){
      return;
    }

    final newPath = p.join((await getTemporaryDirectory()).path, '${DateTime.now()}.${p.extension(croppedImageFile.path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
      croppedImageFile.path,
      newPath,
      quality: 50,
    );

    setState(() {
      _image = File(result!.path);
    });
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        builder: (context) => Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: (){
                Navigator.of(context).pop();
                _getImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.filter),
              title: const Text('Gallery'),
              onTap: (){
                Navigator.of(context).pop();
                _getImage(ImageSource.gallery);
              },
            ),
          ],
        ),
        onClosing: (){}, 
      )
    );
  }

  void _handleLogin(){
    if(nameTF.getText().isEmpty || rarityTF.getText().isEmpty || categoryTF.getText().isEmpty || typeTF.getText().isEmpty || detailTF.getText().isEmpty || priceTF.getText().isEmpty || quantityTF.getText().isEmpty || _image == null){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All fields must be filled!"))
      );
    }
    else{



      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data sucessfully added"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorLight,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: 
                InkWell(
                  onTap: () async {
                    await _selectPhoto();
                  },
                  child: Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: _image != null ?
                      Image.file(_image!.absolute, fit: BoxFit.cover,): const Center(
                        child: Icon(Icons.add_photo_alternate_outlined, size: 32,),
                      ),
                  ),
                ),

              ),
              
              const SizedBox(height: 10,),
              nameTF,
              const SizedBox(height: 10,),
              rarityTF,
              const SizedBox(height: 10,),
              categoryTF,
              const SizedBox(height: 10,),
              typeTF,
              const SizedBox(height: 10,),
              detailTF,
              const SizedBox(height: 10,),
              priceTF,
              const SizedBox(height: 10,),
              quantityTF,

              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Submit')
              ),
              const SizedBox(height: 20,)
            ],
          ),
        )
      ),
    );
  }
}