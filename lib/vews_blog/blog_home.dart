import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/services/crud.dart';
import 'package:flutter_chat/vews_blog/create_blog.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  CrudMethods crudMethods = CrudMethods();
  Stream blogsStream;

  Widget blogsList(){ // before edit BlogsList

    return Container (
    
      child: SingleChildScrollView(

      child: blogsStream != null ? Column(
        children: [
          StreamBuilder(
            stream: blogsStream,
            builder: (context , snapshot){
              return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return BlogsTitle(
                authorName: snapshot.data.docs[index].data()['authorName'],
                title: snapshot.data.docs[index].data()['title'],
                description: snapshot.data.docs[index].data()['desc'],
                imagUrl: snapshot.data.docs[index].data()['imagUrl'],

                );
            },);

            },),
          
        ],
      ):Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(backgroundColor: Colors.red,),
              ),),
    );
  }
  @override
  void initState() {
    super.initState();
    crudMethods.getData().then((result){
      blogsStream = result; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Page",style: TextStyle(fontSize: 22),),
            Text("News",style: TextStyle(fontSize: 22,color: Colors.red),)
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        ),
        body: blogsList(), // before BlogeList
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              FloatingActionButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>CreateBlog()));

              },child: Icon(Icons.add),backgroundColor: Colors.red,)
            ],),
          ),
      
    );
  }
}

// ignore: must_be_immutable
class BlogsTitle extends StatelessWidget {
  String imagUrl,title , description, authorName;
  BlogsTitle({@required this.imagUrl, @required this.title,@required this.description,@required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        
        children: <Widget>[

          ClipRRect(
            child: CachedNetworkImage(imageUrl: imagUrl ,
            ////CachedNetworkImage(imageUrl: imagUrl
            ///Image.network(imagUrl
            height: 220,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            ),
            borderRadius: BorderRadius.circular(6),
            ),


          Container(
            padding: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color:  Colors.black26,
              borderRadius: BorderRadius.circular(6),
              
            ),
            child:Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,textAlign: TextAlign.center,style: TextStyle(color: Colors.white ,fontSize: 25,fontWeight: FontWeight.w900),),
                  SizedBox(height: 4,),
                  Text(description,style: TextStyle(color: Colors.white ,fontSize: 17,fontWeight: FontWeight.w400),),
                  SizedBox(height: 4,),
                  Text(authorName,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w200),),
                  SizedBox(height: 8,),
                ],
              ),
            ),
          ),
         

        ],
      ),
      
    );
  }
}