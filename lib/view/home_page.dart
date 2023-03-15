import 'package:flutter/material.dart';
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          _NewsOfTheDayColumn(),
          _BreakingNewsColumn(),
        ],
      ),
    );
  }
}

class _BreakingNewsColumn extends StatelessWidget {
  const _BreakingNewsColumn();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
              )
            ],
          )
        ],
      ),
    );
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
                    label: 'News of the day',
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
