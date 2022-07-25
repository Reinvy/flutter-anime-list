import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anime_list/provider/anime_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context) {
    AnimeProvider animeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Anime'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: animeProvider.getDetailAnime(id),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.blue.withOpacity(0.5), BlendMode.dstATop),
                        image: NetworkImage(
                          animeProvider.detailAnime.thumb,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  animeProvider.detailAnime.thumb,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                animeProvider.getGenre(
                                  animeProvider.detailAnime.genreList,
                                ),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                animeProvider.detailAnime.title,
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                animeProvider.detailAnime.titleJp,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                animeProvider.detailAnime.producer,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${animeProvider.detailAnime.totalEpisode} Episode',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  animeProvider.detailAnime.status ==
                                          'Completed'
                                      ? const Icon(Icons.check, size: 17)
                                      : const Icon(Icons.schedule_rounded,
                                          size: 17),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    animeProvider.detailAnime.status,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(
                      animeProvider.detailAnime.synopsis,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
