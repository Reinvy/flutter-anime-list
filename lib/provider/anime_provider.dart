import 'package:anime_list/models/anime_detail_model.dart';
import 'package:anime_list/models/anime_list_model.dart';
import 'package:anime_list/services/anime_api.dart';
import 'package:flutter/material.dart';

class AnimeProvider with ChangeNotifier {
  final AnimeAPI _animeApi = AnimeAPI();
  List<AnimeListModel> listAnime = [];
  List<AnimeListModel> libraryAnime = [];
  late AnimeDetailModel detailAnime;

  void getAnimeList() async {
    listAnime = await _animeApi.getAllAnimeList();
    notifyListeners();
  }

  Future<bool> getDetailAnime(id) async {
    detailAnime = await _animeApi.getAnimeById(id);
    notifyListeners();
    return true;
  }

  getGenre(List<GenreModel> genreList) {
    String genre = '';
    for (var element in genreList) {
      genre += '${element.genreName}, ';
    }

    genre = genre.substring(0, genre.length - 2);
    return genre;
  }

  addToLibrary(AnimeListModel animeList) {
    libraryAnime.add(animeList);
    notifyListeners();
  }

  deleteFromLibrary(AnimeListModel animeList) {
    libraryAnime.remove(animeList);
    notifyListeners();
  }
}
