import 'Source.dart';

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String?, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] ??= 'Unkown',
      title: json['title'],
      description: json['description'] ??= 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
      url: json['url'],
      urlToImage: json['urlToImage'] ??= 'https://i.pcmag.com/imagery/articles/00Cx7vFIetxCuKxQeqPf8mi-23.fit_lim.size_1600x900.v1643131202.jpg',
      publishedAt: json['publishedAt'],
      content: json['content'] ??=
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam quis enim lobortis scelerisque. Ullamcorper a lacus vestibulum sed arcu. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros. Nisi est sit amet facilisis. Scelerisque eleifend donec pretium vulputate sapien. Viverra justo nec ultrices dui. Sodales ut eu sem integer vitae justo eget. Dolor magna eget est lorem ipsum dolor.',
    );
  }
}
