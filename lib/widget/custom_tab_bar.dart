// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/services/news_api_service.dart';

import 'dart:math';
import '../model/article.dart';
import 'image_container.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;
  final NewsApiService apiService = NewsApiService(
    endpotintUrl: 'https://newsapi.org/v2/top-headlines?country=us&apiKey=d3c1fb78986f4a07806e3c79a3de0ca6',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: tabs
                .map(
                  (tab) => FutureBuilder(
                    future: apiService.fetchArticles(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        List<Article> articles = snapshot.data;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (BuildContext context, int index) {
                              int hours = parseDate(articles, index);
                              String formatedDate = hours > 24 ? '${(hours / 24).ceil()} days ago' : '$hours hours ago';
                              return Container(
                                margin: const EdgeInsets.only(bottom: 22),
                                child: Row(
                                  children: [
                                    ImageContainer(
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      borderRadius: 10,
                                      height: MediaQuery.of(context).size.width * 0.2,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            articles[index].title,
                                            overflow: TextOverflow.clip,
                                            maxLines: 2,
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.schedule,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                formatedDate,
                                                style: const TextStyle(fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              const Icon(
                                                Icons.visibility_outlined,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(random(10, 575).toString()),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}', style: const TextStyle(color: Colors.black)),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

int parseDate(List<Article> articles, int index) {
  DateTime parsed = DateTime.parse(articles[index].publishedAt);
  Duration diference = DateTime.now().difference(parsed);
  int differenceInHours = diference.inHours;
  return differenceInHours;
}

// Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ImageContainer(
//                                       width: MediaQuery.of(context).size.width * 0.25,
//                                       borderRadius: 16,
//                                       imageUrl: articles[index].urlToImage,
//                                       height: 75,
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width * 0.62,
//                                       child: Text(
//                                         articles[index].title,
//                                         maxLines: 2,
//                                         textAlign: TextAlign.left,
//                                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                                               height: 1.5,
//                                             ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       formatedDate,
//                                       style: TextStyle(
//                                         color: Colors.grey[400],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                   ],
//                                 ),