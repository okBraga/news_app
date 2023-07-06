import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:news_app/widget/custom_bottom_navigation_bar.dart';
import 'package:news_app/widget/custom_chip.dart';

import '../widget/image_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      //TODO see how to maintain the state and the bottomNavBar through the navigation
      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          const _NewsOfTheDayColumn(),
          _BreakingNewsColumn(),
        ],
      ),
    );
  }
}

class _BreakingNewsColumn extends StatelessWidget {
  _BreakingNewsColumn();

  final NewsApiService apiService = NewsApiService(
    endpotintUrl: 'https://newsapi.org/v2/top-headlines?country=us&apiKey=d3c1fb78986f4a07806e3c79a3de0ca6',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'More',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: apiService.fetchArticles(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
              if (snapshot.hasData) {
                List<Article>? articles = snapshot.data;
                return SizedBox(
                  height: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: articles!.length,
                    itemBuilder: (context, index) {
                      String? author = articles[index].author ?? 'Unknown';
                      int hours = parseDateArticles(articles, index);
                      String formatedDate = hours > 24 ? '${(hours / 24).ceil()} days ago' : '$hours hours ago';
                      return GestureDetector(
                        //TODO make the navigation to the tapped article
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/article', arguments: articles[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageContainer(
                                width: MediaQuery.of(context).size.width * 0.6,
                                borderRadius: 16,
                                imageUrl: articles[index].urlToImage,
                                height: 140,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.62,
                                child: Text(
                                  articles[index].title,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        height: 1.5,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                formatedDate,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'By $author',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  static int parseDateArticles(List<Article> articles, int index) {
    DateTime parsed = DateTime.parse(articles[index].publishedAt);
    Duration diference = DateTime.now().difference(parsed);
    int differenceInHours = diference.inHours;
    return differenceInHours;
  }
}

class _NewsOfTheDayColumn extends StatelessWidget {
  const _NewsOfTheDayColumn();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainer(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          imageUrl: 'https://www.florence.edu.br/blog/wp-content/uploads/2021/07/Florence-Dia-Nacional-da-Ciencia.jpg',
          borderRadius: 24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Theme(
                  data: ThemeData(canvasColor: Colors.transparent),
                  child: const CustomChip(
                    label: Text('News of the day'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: Color.fromARGB(97, 243, 236, 236),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        'Learn More',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
