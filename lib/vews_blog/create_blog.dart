import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/services/crud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';


class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {


  String authorName, title,desc;
  bool _isLoading = false;
  
  File _selectedImage;
  final _picker = ImagePicker();

  CrudMethods crudMethods = CrudMethods();
  

  Future getImage() async {
     final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
    
        _selectedImage = File(pickedFile.path);
    });
  }
  uploadBlog() async{
    if(_selectedImage !=null){
  ///uploading image to firbase
       setState(() {
         _isLoading =true;
       });
      StorageReference firbaseReference = FirebaseStorage()
       .ref()
       .child("blogImages")
       .child("${randomAlphaNumeric(9)}.jpg");

       final StorageUploadTask task = firbaseReference.putFile(_selectedImage);
       
      var downloudUrl = await(await task.onComplete).ref.getDownloadURL();
      
      print("this is Url $downloudUrl");
      Map<String,String> blogMap ={
        "imagUrl": downloudUrl,
        "authorName": authorName,
        "title": title,
        "desc": desc,
      };

      crudMethods.addData(blogMap).then((value) => Navigator.pop(context));
      
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create",style: TextStyle(fontSize: 22),),
            Text("News",style: TextStyle(fontSize: 22,color: Colors.red),)
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions:<Widget> [
          GestureDetector(
            onTap: (){
              uploadBlog();
            },
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.file_upload)
              ),
          ),

        ],
        ),
        body: _isLoading ? Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(backgroundColor: Colors.red,),
        ): Container(child: Column(
          children: [
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                getImage();
              },
               child: _selectedImage != null 
               ? Container(
                 height: 170,
                 margin: EdgeInsets.symmetric(horizontal: 16),
                 width: MediaQuery.of(context).size.width,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(6),
                   child: Image.file(_selectedImage,fit: BoxFit.cover,)),
               )
               : Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Icon(Icons.add_a_photo,color: Colors.black45,)
              ),
            ),
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
              decoration: InputDecoration(hintText: "AuthorName"),
              onChanged: (val){
                authorName = val;

              },
            ),
             TextField(
              decoration: InputDecoration(hintText: "Title"),
              onChanged: (val){
                title = val;

              },
            ),
             TextField(
              decoration: InputDecoration(hintText: "Descraption"),
              onChanged: (val){
                desc = val;

              },
            )
                ],
              ),)
            
            ],
        ),),
      
    );
  }
}