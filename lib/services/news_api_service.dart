// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/model/article.dart';

class NewsApiService {
  NewsApiService({
    required this.endpotintUrl,
  });

  String endpotintUrl;

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(endpotintUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      return body.map((dynamic item) => Article.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Articles');
    }
  }
}
