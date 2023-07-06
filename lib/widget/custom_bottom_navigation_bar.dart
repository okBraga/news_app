// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../assets/my_flutter_app_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;

  const CustomBottomNavigationBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.7,
            color: Color.fromRGBO(224, 224, 224, 1),
          ),
        ),
      ),
      height: 85,
      child: BottomNavigationBar(
          currentIndex: index,
          elevation: 3,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: IconButton(
                  icon: const Icon(MyFlutterApp.home),
                  color: Colors.black.withAlpha(160),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(MyFlutterApp.search),
                iconSize: 20,
                color: Colors.black.withAlpha(160),
                onPressed: () {
                  Navigator.pushNamed(context, '/discover');
                },
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  color: Colors.black.withAlpha(160),
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                ),
              ),
              label: 'Profile',
            ),
          ],
          //TODO make the bottom navigation bar change the color off te tapped item
          selectedItemColor: Colors.black
          // onTap: _onItemTapped,
          ),
    );
  }
}
