
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_chat/models/article_model.dart';

class News {
  
  List<ArticleModel> news=[];
  
  Future<void> getNews() async{
    
  String url = "http://newsapi.org/v2/top-headlines?country=us&apiKey=7c6486a17a1a46f1b1d3090ffc959f6d";
  var respone = await http.get(url);
  var jsonData = jsonDecode(respone.body);
  if(jsonData['status'] == "ok"){
    jsonData['articles'].forEach((element){
      
      if(element['urlToImage'] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );

        news.add(articleModel);
      



      }


    });
  }
  }
}

class CategoryNewsClass {
  
  List<ArticleModel> news=[];
  
  Future<void> getNews(String category) async{
    
  String url = "http://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=7c6486a17a1a46f1b1d3090ffc959f6d";
  var respone = await http.get(url);
  var jsonData = jsonDecode(respone.body);
  if(jsonData['status'] == "ok"){
    jsonData['articles'].forEach((element){
      if(element['urlToImage'] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );

        news.add(articleModel);
      



      }


    });
  }
  }
}