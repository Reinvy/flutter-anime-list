import 'package:anime_list/views/screens/home_screen.dart';
import 'package:anime_list/views/screens/library_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _page = 0;

  final List<Widget> _listPage = [
    const HomeScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime List'),
        centerTitle: true,
      ),
      body: _listPage[_page],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
        color: Colors.blue,
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(Icons.home),
          Icon(Icons.bookmark),
        ],
      ),
    );
  }
}
