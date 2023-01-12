import 'dart:html';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? pic;

  final _picker = ImagePicker();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Upload File'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: pic == null
                ? Center(
                    child: Text('Pick image'),
                  )
                : Container(
                    child:
                        Center(child: Image.file(File(pic?.relativePath).absolute,
    height: 100,
    width: 100,
    fit: BoxFit.cover,),
                  ),
          )
        ],
      ),
    );
  }
}
