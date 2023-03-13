import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

class NewsApiService {
  final endpotintUrl = 'https://newsapi.org/v2/everything?q=keyword&apiKey=d3c1fb78986f4a07806e3c79a3de0ca6';

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(endpotintUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      return body.map((dynamic item) => Article.fromJson(item)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
