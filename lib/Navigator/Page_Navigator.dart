
import 'package:flutter/material.dart';
import 'package:flutter_chat/vews_blog/blog_home.dart';
import 'package:flutter_chat/views/home.dart';

class PageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("latest"),
          Text("News", style: TextStyle(color: Colors.red),),
        ],
      ),
      elevation: 0.0,
      centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),

        child: Column(
        children: [ 
            Container(
              
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
    
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                 builder: (context)=> Home()));
              
                },
                
                child: Stack(

                  children: [
                    Container(

                    child: ClipRRect(
           
               borderRadius: BorderRadius.circular(6),
               child: Image.asset('assets/bg5.jpg',
              height: 200
               ,fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,

               ),),
               
               ),

               Align(
                 alignment: Alignment.center,
                 child: Padding(
                   padding: const EdgeInsets.only(top: 70),
                   child: Text("International news",style: TextStyle(color: Colors.white ,fontSize: 25,fontWeight: FontWeight.w900),),
                 )),
                  ],
                ),
               

               ),
               

               ),


               

           SizedBox(height: 8,),

           Container(
              
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
    
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                 builder: (context)=> BlogHome()));
              
                },

                child: Stack(
                  children: [
                    Container(
                    child: ClipRRect(
           
               borderRadius: BorderRadius.circular(6),
               child: Image.asset('assets/b4.jpg',
              height: 200
               ,fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
               ),),),

               Align(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 70 ),
                   child: Text("Create News",textAlign: TextAlign.center,style: TextStyle(color: Colors.white ,fontSize: 25,fontWeight: FontWeight.w900),),
                 )),
                  ],
                ),
               ),

               ),
               

           SizedBox(height: 8,),

          

         ]),
         
          ),         
        
      
      
    );
  }
}