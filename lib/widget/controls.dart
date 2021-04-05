import 'package:flutter/material.dart';

class ReadDeleteControls extends StatelessWidget {
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  const ReadDeleteControls({
    @required this.onClickedScanText,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onClickedClear,
          child: Container(
            alignment: Alignment.center,
            height: _screenHeight/13,
            width: _screenWidth/2.2,
            color: Colors.red,
            child: Text('Delete',style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onClickedScanText,
          child: Container(
            alignment: Alignment.center,
            height: _screenHeight/13,
            width: _screenWidth/2.2,
            color: Colors.green,
            child: Text('Read the Text',style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    );
  }
}
class GalleryCameraControls extends StatelessWidget {
  final VoidCallback onClickedGallery;
  final VoidCallback onClickedCamera;
  const GalleryCameraControls({
    @required this.onClickedGallery,
    @required this.onClickedCamera,
    Key key,
  }): super (key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          elevation: 15,
          child: Icon(Icons.folder,size: 40,),
          tooltip: "select an Image..",
          onPressed: onClickedGallery,
        ),
        const SizedBox(width: 10),

        FloatingActionButton(
          elevation: 15,
          child: Icon(Icons.camera,size: 40,),
          tooltip: "select an Image..",
          onPressed: onClickedCamera,
        ),
      ],
    );
  }
}
