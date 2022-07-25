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
}
