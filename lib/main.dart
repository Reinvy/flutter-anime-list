import 'package:anime_list/provider/anime_provider.dart';
import 'package:anime_list/views/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AnimeProvider();
      },
      child: const MaterialApp(
        home: MainNavigation(),
      ),
    );
  }
}
