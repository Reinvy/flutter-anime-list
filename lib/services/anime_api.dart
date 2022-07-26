import 'package:dio/dio.dart';
import 'package:anime_list/models/anime_detail_model.dart';
import 'package:anime_list/models/anime_list_model.dart';

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

  Future<AnimeDetailModel> getAnimeById(String id) async {
    try {
      Response response = await dio.get('${_baseUrl}anime/$id');
      AnimeDetailModel detailAnime = AnimeDetailModel.fromJson(response.data);
      return detailAnime;
    } catch (e) {
      rethrow;
    }
  }
}
