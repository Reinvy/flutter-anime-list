// ignore_for_file: unnecessary_new, prefer_collection_literals

class AnimeListModel {
  late String title;
  late String id;
  late String thumb;
  late String episode;
  late String uploadedOn;
  late double score;

  AnimeListModel(
    this.title,
    this.id,
    this.thumb,
    this.episode,
    this.uploadedOn,
    this.score,
  );

  AnimeListModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'].replaceAll('https://otakudesu.watch/anime/', '');
    thumb = json['thumb'];
    episode = json['episode'];
    uploadedOn = json['uploaded_on'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['id'] = id;
    data['thumb'] = thumb;
    data['episode'] = episode;
    data['uploaded_on'] = uploadedOn;
    data['score'] = score;
    return data;
  }
}
