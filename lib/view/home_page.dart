import 'package:flutter/material.dart';
import 'package:news_app/widget/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
      body: Container(),
    );
  }
}
