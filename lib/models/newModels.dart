class NewsModel {


  String? title;
  String? author;
  String? description;
  String? urlToImage; 
  String? content; 

  NewsModel();

  NewsModel.fromJson(Map<String, dynamic> json){

    title = json ['title'];
    author = json ['author'];
    description = json ['description'];
    urlToImage = json['urlToImage'];
    content = json ['content'];
  }



}