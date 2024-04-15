
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}
 File? imagefile;
class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    XFile? image;
   

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            imagefile!=null? 
            Image.file(imagefile!,height: 500,width: 500,fit: BoxFit.fill,):
            const Padding(
              padding: EdgeInsets.only(top:20),
              child: Text(
                "Select image",
                style: TextStyle(fontSize: 30),           
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    // final ImagePicker picker = ImagePicker();
                    // image = await picker.pickImage(source: ImageSource.gallery);
                    _pickimageFromGallery();
                  
                   
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(15, 15)),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    height: 100,
                    width: 150,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                      child: Image.asset('asset/images/gallery.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                  _pickimageFromCamera();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(15, 15)),
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        )),
                    height: 100,
                    width: 150,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                      child: Image.asset('asset/images/camera2.png'),

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
 Future _pickimageFromGallery()async{
 final returedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
   imagefile=File( returedImage!.path);
  setState(() {
});
 } 
 Future _pickimageFromCamera()async{
 final returedImage= await ImagePicker().pickImage(source: ImageSource.camera);
   imagefile=File( returedImage!.path);
  setState(() {
});
 }
}
