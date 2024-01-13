import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/view/category/category_screen.dart';
import 'package:ott_app/view/explore/explore_screen.dart';
import 'package:ott_app/view/favourite/favourite_screen.dart';
import 'package:ott_app/view/home/home_screen.dart';
import 'package:ott_app/view/profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedScreen = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const ExploreScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          Tooltip(
            message: "Home",
            child: Icon(
              _selectedScreen == 0 ? Icons.home : Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          Tooltip(
            message: "Category",
            child: Icon(
              _selectedScreen == 1 ? Icons.category : Icons.category_outlined,
              color: Colors.white,
            ),
          ),
          Tooltip(
            message: "Search",
            child: Icon(
              _selectedScreen == 2 ? Icons.explore : Icons.explore_outlined,
              color: Colors.white,
            ),
          ),
          Tooltip(
            message: "Favorites",
            child: Icon(
              _selectedScreen == 3 ? Icons.favorite : Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
          Tooltip(
            message: "Profile",
            child: Icon(
              _selectedScreen == 4 ? Icons.person : Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
