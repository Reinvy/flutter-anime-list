import 'package:anime_list/models/anime_list_model.dart';
import 'package:dio/dio.dart';

class AnimeAPI {
  final Dio dio = Dio();
  final String _baseUrl = 'https://otakudesu-api.herokuapp.com/api/';

  Future<List<AnimeListModel>> getAllAnimeList() async {
    try {
      Response response = await dio.get('${_baseUrl}complete/');

      List<AnimeListModel> listAnime = [];
      response.data['animeList'].forEach((v) {
        listAnime.add(AnimeListModel.fromJson(v));
      });
      return listAnime;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeListModel>> getAnimeById(String id) async {
    try {
      Response response = await dio.get('${_baseUrl}anime/$id');

      List<AnimeListModel> listAnime = [];
      response.data['animeList'].forEach((v) {
        listAnime.add(AnimeListModel.fromJson(v));
      });

      return listAnime;
    } catch (e) {
      print('error');
      print(e);
      rethrow;
    }
  }
}
