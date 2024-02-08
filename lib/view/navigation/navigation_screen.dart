import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/firebase/remote_config/remote_config.dart';
import 'package:ott_app/view/explore/explore_screen.dart';
import 'package:ott_app/view/favourite/favourite_screen.dart';
import 'package:ott_app/view/home/home_screen.dart';
import 'package:ott_app/view/profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with RemoteConfig {
  int _selectedScreen = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    initializeRemoteConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Futtru OTT"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: _pages[_selectedScreen],
      bottomNavigationBar: DotNavigationBar(
        paddingR: EdgeInsets.zero,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        dotIndicatorColor: Colors.transparent,
        itemPadding: const EdgeInsets.all(15),
        marginR: const EdgeInsets.symmetric(horizontal: 25),
        currentIndex: _selectedScreen,
        onTap: (e) {
          setState(() {
            _selectedScreen = e;
          });
        },
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.explore),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.favorite),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
