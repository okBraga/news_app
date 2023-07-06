import 'dart:math';

import 'package:flutter/material.dart';

import '../model/article.dart';
import '../widget/custom_chip.dart';
import '../widget/custom_tab_bar.dart';
import '../widget/image_container.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as Article;
    int hours = parseDateArticle(article);
    String formatedDate = hours > 24 ? '${(hours / 24).ceil()}d' : '${hours}h';

    return ImageContainer(
      borderRadius: 0,
      width: 10,
      height: 10,
      imageUrl: article.urlToImage,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            UpperNews(article: article),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomChip(
                        labelPadding: EdgeInsets.all(5),
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/3777570/pexels-photo-3777570.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                        label: Text(
                          'Michael S.',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black87,
                      ),
                      CustomChip(
                        backgroundColor: Colors.grey.shade200,
                        avatar: Icon(
                          Icons.schedule,
                          color: Colors.grey[350],
                        ),
                        label: Text(formatedDate),
                        labelPadding: EdgeInsets.all(1),
                      ),
                      CustomChip(
                          backgroundColor: Colors.grey.shade200,
                          label: Row(
                            children: [
                              Icon(
                                Icons.visibility_outlined,
                                size: 18,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                random(10, 575).toString(),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    article.content.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpperNews extends StatelessWidget {
  const UpperNews({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: const CustomChip(
              label: Text('Health'),
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor: Color.fromARGB(97, 243, 236, 236),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            article.title,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                ),
          ),
        ],
      ),
    );
  }
}

int parseDateArticle(Article article) {
  DateTime parsed = DateTime.parse(article.publishedAt);
  Duration diference = DateTime.now().difference(parsed);
  int differenceInHours = diference.inHours;
  return differenceInHours;
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}
