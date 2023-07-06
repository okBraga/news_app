import 'package:flutter/material.dart';

import 'package:news_app/view/article_page.dart';
import 'package:news_app/view/discover_page.dart';
import 'package:news_app/view/home_page.dart';
import 'package:news_app/view/user_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'News App';

    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          //TODO titleLarge: define this to the 'DISCOVER' in discover page,
          //TODO define chip size
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      title: appTitle,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/discover': (context) => const DiscoverPage(),
        '/user': (context) => const UserPage(),
        '/article': (context) => const ArticlePage(),
      },
    );
  }
}
