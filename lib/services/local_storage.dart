import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anime_list/models/anime_list_model.dart';

class LocalStorage {
  Future saveLibrary(List<AnimeListModel> listAnime) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonLibrary = jsonEncode(listAnime);

    await prefs.remove('counter');
    await prefs.setString('saveLibrary', jsonLibrary);
  }

  Future loadLibrary() async {
    final prefs = await SharedPreferences.getInstance();
    List<AnimeListModel> listLibrary = [];
    String? jsonLibrary = prefs.getString('saveLibrary');

    if (jsonLibrary != null) {
      var library = json.decode(jsonLibrary);
      library.forEach((v) {
        listLibrary.add(AnimeListModel.fromJson(v));
      });
    }

    return listLibrary;
  }
}
