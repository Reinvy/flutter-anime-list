import 'package:anime_list/models/anime_list_model.dart';
import 'package:dio/dio.dart';

class AnimeAPI {
  final Dio dio = Dio();
  final String _baseUrl = 'https://otakudesu-api.herokuapp.com/api/';

  getAllAnimeList() async {
    try {
      Response response = await dio.get('${_baseUrl}complete/');

      List<AnimeListModel> listAnime = [];
      response.data['animeList'].forEach((v) {
        listAnime.add(AnimeListModel.fromJson(v));
      });

      print(listAnime[0].title);
    } catch (e) {
      print('error');
      print(e);
    }
  }

  getAnimeById(String id) async {
    try {
      Response response = await dio.get('${_baseUrl}anime/$id');

      List<AnimeListModel> listAnime = [];
      response.data['animeList'].forEach((v) {
        listAnime.add(AnimeListModel.fromJson(v));
      });

      print(listAnime[0].title);
    } catch (e) {
      print('error');
      print(e);
    }
  }
}
