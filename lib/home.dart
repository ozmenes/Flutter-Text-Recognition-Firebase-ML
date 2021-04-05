import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textrecognition/api/firebase_mi_api.dart';

import 'widget/controls.dart';
import 'widget/textarea_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';
  File image;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: buildImage()),
            const SizedBox(height: 30),
            GalleryCameraControls(
              onClickedCamera: takeImage,
              onClickedGallery: pickImage,
            ),
            const SizedBox(height: 30),
            ReadDeleteControls(
              onClickedScanText: scanText,
              onClickedClear: clear,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextAreaWidget(
                text: text,
                onClickedCopy: copyToClipboard,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(


    child:
    image != null
        ? Container(
            height: _screenHeight / 1.5,
            width: _screenWidth / 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(image), fit: BoxFit.cover
                )
            ),
          )
        : Icon(Icons.photo, size: 80, color: Colors.black)
    ,
    );
  }
  Future takeImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.camera);
    setImage(File(file.path));
  }
  Future pickImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    setImage(File(file.path));
  }
  Future scanText() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: CircularProgressIndicator(

        ),
      ),
    );

    final text = await FirebaseMLApi.recogniseText(image);
    setText(text);

    Navigator.of(context).pop();
  }
  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
