import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anime_list/provider/anime_provider.dart';
import 'package:anime_list/views/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimeProvider animeProvider = Provider.of(context);
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 4 / 6,
        crossAxisCount: MediaQuery.of(context).size.width < 800 ? 2 : 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (ctx, i) {
        return InkWell(
          onLongPress: () {
            if (animeProvider.libraryAnime.any(
                (element) => element.id == animeProvider.listAnime[i].id)) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete from Library'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Fungsi Delete from Library
                          int index = animeProvider.libraryAnime.indexWhere(
                              (element) =>
                                  element.id == animeProvider.listAnime[i].id);
                          animeProvider.deleteFromLibrary(
                            animeProvider.libraryAnime[index],
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Add to Library'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Fungsi Add to Library
                          animeProvider.addToLibrary(
                            animeProvider.listAnime[i],
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) {
                return DetailScreen(
                  id: animeProvider.listAnime[i].id,
                );
              }),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    animeProvider.listAnime[i].thumb,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (animeProvider.libraryAnime.any((element) =>
                            element.id == animeProvider.listAnime[i].id))
                          const Icon(
                            Icons.bookmark_added,
                            color: Colors.orange,
                            size: 28,
                          )
                        else
                          const Icon(
                            Icons.bookmark_add,
                            color: Colors.grey,
                            size: 28,
                          ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${animeProvider.listAnime[i].score}',
                          style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      animeProvider.listAnime[i].title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: animeProvider.listAnime.length,
    );
  }
}
