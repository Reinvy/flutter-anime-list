import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/anime_provider.dart';
import 'detail_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

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
                        animeProvider.deleteFromLibrary(
                          animeProvider.libraryAnime[i],
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                );
              },
            );
          },
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) {
                return DetailScreen(
                  id: animeProvider.libraryAnime[i].id,
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
                    animeProvider.libraryAnime[i].thumb,
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
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${animeProvider.libraryAnime[i].score}',
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
                      animeProvider.libraryAnime[i].title,
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
      itemCount: animeProvider.libraryAnime.length,
    );
  }
}
