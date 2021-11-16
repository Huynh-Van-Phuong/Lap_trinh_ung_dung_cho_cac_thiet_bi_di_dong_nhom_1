import 'dart:convert';

News newFromJson(String str) => News.fromJson(json.decode(str));

String userToJson(News data) => json.encode(data.toJson());
class News {
  String status;
  int totalResults;
  List<Articles> articles;

  News({ required this.status, required this.totalResults, required this.articles});

  factory News.fromJson(Map<String, dynamic> json) => News(

      status : json['status'],
      totalResults : json['totalResults'],
      articles: List<Articles>.from(json["articles"].map((x) => Articles.fromJson(x)))
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articles(
      {
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content});

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    source :  Source.fromJson(json['source']),
    author : (json['author']==null)?"":json['author'],
    title : json['title'],
    description : json['description'],
    url : json['url'],
    urlToImage : (json['urlToImage']== null)? "":json['urlToImage'],
    publishedAt : json['publishedAt'],
    content : json['content'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String id;
  String name;

  Source({ required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? "" : json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
