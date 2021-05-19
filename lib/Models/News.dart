

class  News {
  final String author;
  final String title;
  final String description;
  final String content;
  final String url;
  final String urlToImage;
  // final DateTime publishedAt;

  News(
      {required this.author,
        required this.title,
        required this.description,
        required this.content,
        required this.url,
        required this.urlToImage,
        // required this.publishedAt
      });

  factory  News.fromJson(Map<String, dynamic> data) =>  News(
    author: data["author"] ?? "",
    title: data["title"]?? "",
    description: data["description"]?? "",
    content: data["content"]?? "",
    url: data["url"]?? "",
    urlToImage: data["urlToImage"]?? "",
    // publishedAt: DateTime.parse(data["publishedAt"]),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'author': author,
    'title': title,
    'description': description,
    'content': content,
    'url': url,
    'urlToImage': urlToImage,
    // 'publishedAt': publishedAt,
  };
}
