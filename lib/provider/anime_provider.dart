import 'package:anime_list/models/anime_list_model.dart';
import 'package:anime_list/services/anime_api.dart';
import 'package:flutter/material.dart';

class AnimeProvider with ChangeNotifier {
  final AnimeAPI animeApi = AnimeAPI();
  List<AnimeListModel> listAnime = [];

  getAnimeList() async {
    listAnime = await animeApi.getAllAnimeList();
    print(listAnime[0].title);
    notifyListeners();
  }
}
