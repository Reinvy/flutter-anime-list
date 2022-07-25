import 'package:flutter/material.dart';
import 'package:anime_list/models/anime_detail_model.dart';
import 'package:anime_list/models/anime_list_model.dart';
import 'package:anime_list/services/anime_api.dart';
import 'package:anime_list/services/local_storage.dart';

class AnimeProvider with ChangeNotifier {
  final AnimeAPI _animeApi = AnimeAPI();
  final LocalStorage _localStorage = LocalStorage();
  List<AnimeListModel> listAnime = [];
  List<AnimeListModel> libraryAnime = [];
  late AnimeDetailModel detailAnime;

  Future<bool> getAnimeList() async {
    libraryAnime = await _localStorage.loadLibrary();
    listAnime = await _animeApi.getAllAnimeList();
    notifyListeners();
    return true;
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

  addToLibrary(AnimeListModel animeList) async {
    libraryAnime.add(animeList);
    await _localStorage.saveLibrary(libraryAnime);
    notifyListeners();
  }

  deleteFromLibrary(AnimeListModel animeList) async {
    libraryAnime.remove(animeList);
    await _localStorage.saveLibrary(libraryAnime);
    notifyListeners();
  }
}
