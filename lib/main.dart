// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:news_app/services/news_api_service.dart';

import 'model/article.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'News App';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final NewsApiService apiService = NewsApiService();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: apiService.fetchArticles(),
        builder: (context, snapshot) {
          // if (snapshot.hasError) {
          //   return const Center(
          //     child: Text('An error has occurred!'),
          //   );
          // }
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(articles![index].title),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Image.network(articles[index].urlToImage as String);
      },
    );
  }
}
