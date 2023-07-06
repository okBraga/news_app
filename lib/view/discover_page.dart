import 'package:flutter/material.dart';
import 'package:news_app/widget/custom_tab_bar.dart';

import '../widget/custom_bottom_navigation_bar.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = [
      'General',
      'Technology',
      'Science',
      'Business',
      'Entertainment',
      'Health',
      'Sports',
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        drawer: const Drawer(
          elevation: 0,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        //TODO see how to maintain the state and the bottomNavBar through the navigation
        bottomNavigationBar: const CustomBottomNavigationBar(
          index: 1,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            const DiscoverSection(),
            const SizedBox(
              height: 40,
            ),
            CustomTabBar(
              tabs: tabs,
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'News from all over the world',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade400,
                fontSize: 13,
              ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
