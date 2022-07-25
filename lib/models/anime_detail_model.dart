class AnimeDetailModel {
  late String id;
  late String title;
  late String titleJp;
  late String synopsis;
  late String producer;
  late String type;
  late String status;
  late int totalEpisode;
  late String duration;
  late String releaseDate;
  late String studio;
  late List<GenreModel> genreList;
  late String thumb;
  late double score;

  AnimeDetailModel(
    this.id,
    this.title,
    this.titleJp,
    this.synopsis,
    this.producer,
    this.type,
    this.status,
    this.totalEpisode,
    this.duration,
    this.releaseDate,
    this.studio,
    this.genreList,
    this.thumb,
    this.score,
  );

  AnimeDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['anime_id'];
    title = json['title'];
    titleJp = json['japanase'];
    synopsis = json['synopsis'];
    producer = json['producer'];
    type = json['type'];
    status = json['status'];
    totalEpisode = json['total_episode'];
    duration = json['duration'];
    releaseDate = json['release_date'];
    studio = json['studio'];
    if (json['genre_list'] != null) {
      genreList = [];
      json['genre_list'].forEach((v) {
        genreList.add(GenreModel.fromJson(v));
      });
    }
    thumb = json['thumb'];
    score = json['score'];
  }
}

class GenreModel {
  late String genreName;

  GenreModel(this.genreName);

  GenreModel.fromJson(Map<String, dynamic> json) {
    genreName = json['genre_name'];
  }
}
