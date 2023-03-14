import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.search),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/user');
                },
              ),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black
        // onTap: _onItemTapped,
        );
  }
}
