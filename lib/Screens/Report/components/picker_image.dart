import 'dart:io';
import 'package:appartmentapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatefulWidget {
  final User user;
  const ImageWidget({Key? key,  required this.user}) : super(key: key);
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  var _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children:[
          // avatar
          BuildImage(),
          // change avatar
          Positioned(
            bottom:0,
            right: 0,
            child: BuildEditImage(),
          ),
        ] 
      )
    );
                
  }
  Widget BuildImage(){
    return Ink(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        // nền avatar
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.1)
          )
        ],
        shape: BoxShape.circle,
        // Avatar
        image: DecorationImage(
          fit: BoxFit.cover,
          image: _imageFile == null
            ? widget.user.getImage.image
            : FileImage(File(_imageFile!.path))
        )
      ),
      child: InkWell(onTap: (){changeImage();},),
    );
  }
  Widget BuildEditImage(){
    return Ink(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape:BoxShape.circle,
        color: Colors.white
      ),
      child: InkWell(
        child: Icon(
        Icons.image_outlined,
        color: Colors.black,
        size:30,
        ),
        onTap: (){changeImage();},
      )
      
    );
  }
  Widget bottomSheet(){
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal:20,
        vertical:20,
      ),
      child: ListView(
        children: <Widget>[
          Text(
            "Chọn hình ảnh",
            style: TextStyle(
              fontSize: 20,
              
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: (){
                  takePhoto(ImageSource.camera);
                },
                label: Text("Máy ảnh"),
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Thư viện"),
              )
            ],
          )
        ],
      ),
    );
  }
  void takePhoto(ImageSource imageSource) async {
    XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
    );
    setState((){
      _imageFile = File(pickedFile!.path);
//      widget.user.setImage = FileImage(File(_imageFile)) as Image;
    });
  }
  // Hàm thay đổi hình ảnh
  void changeImage() {
    print(_imageFile);
    showModalBottomSheet(
      context: context,
      builder: (builder) =>bottomSheet(),
    );
    
  }
  
}
