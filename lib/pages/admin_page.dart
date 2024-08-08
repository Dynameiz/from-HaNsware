import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:from_hansware/components/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AdminPage extends StatefulWidget {

  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  final ImagePicker _imagePicker = ImagePicker();
  String? imageUrl;

  final MyTextField nameTF = MyTextField(textHint: "Name");
  final MyTextField rarityTF = MyTextField(textHint: "Rarity");
  final MyTextField categoryTF = MyTextField(textHint: "Category");
  final MyTextField typeTF = MyTextField(textHint: "Type");
  final MyTextField detailTF = MyTextField(textHint: "Detail");
  final MyTextField priceTF = MyTextField(textHint: "Price");
  final MyTextField quantityTF = MyTextField(textHint: "Quantity");

  Future<XFile> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path, '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );

    return result!;
  }

  Future _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source, imageQuality: 50);
    if (pickedFile == null){
      return;
    }

    var file = await ImageCropper.platform.cropImage(sourcePath: pickedFile.path, aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
    if (file == null){
      return;
    }

    file = (await compressImage(file.path, 35)) as CroppedFile?;
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(context: context, builder: (context) => BottomSheet(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(leading: const Icon(Icons.camera), title: const Text('Camera'), onTap: (){
            Navigator.of(context).pop();
            _pickImage(ImageSource.camera);
          },),
          ListTile(leading: const Icon(Icons.filter), title: const Text('Pick a file'), onTap: (){
            Navigator.of(context).pop();
            _pickImage(ImageSource.gallery);
          },)
        ],
      ),
      onClosing: (){},
      )
    );
  }

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
              GestureDetector(
                onTap: _selectPhoto,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    width: 240,
                    height: 240,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if(imageUrl == null)
                         const Icon(Icons.add, size: 64,),
                         const SizedBox(height: 10,),
                         const Text("Add photo"),
                        if(imageUrl != null)
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => _selectPhoto,
                            child: Image.network(imageUrl!),
                          ),
                      ],
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
              ElevatedButton(onPressed: () =>{
                if(nameTF.getText().isEmpty || rarityTF.getText().isEmpty || categoryTF.getText().isEmpty || typeTF.getText().isEmpty || detailTF.getText().isEmpty || priceTF.getText().isEmpty || quantityTF.getText().isEmpty){
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