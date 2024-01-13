import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/view/favourite/favourite_screen.dart';
import 'package:ott_app/view/home/home_screen.dart';
import 'package:ott_app/view/search/search_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedScreen = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavouriteScreen(),
    const FavouriteScreen(),
    const FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: _pages[_selectedScreen],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepPurple,
        backgroundColor: Colors.transparent,
        onTap: (e) {
          setState(() {
            _selectedScreen = e;
          });
        },
        items: [
          Icon(
            _selectedScreen == 0 ? Icons.home : Icons.home_outlined,
            color: Colors.white,
          ),
          const Icon(Icons.search, color: Colors.white),
          const Icon(Icons.search, color: Colors.white),
          const Icon(Icons.search, color: Colors.white),
          Icon(
            _selectedScreen == 2 ? Icons.favorite : Icons.favorite_outline,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
