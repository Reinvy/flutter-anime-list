import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:anime_list/models/anime_list_model.dart';
import 'package:anime_list/provider/anime_provider.dart';
import 'package:anime_list/views/home_screen.dart';
import 'package:anime_list/views/library_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _page = 0;

  List<AnimeListModel> listAnime = [];

  final List<Widget> _listPage = [
    const HomeScreen(),
    const LibraryScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AnimeProvider>(context, listen: false).getAnimeList();
    });

    super.initState();
  }

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
