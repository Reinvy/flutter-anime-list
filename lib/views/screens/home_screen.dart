import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://otakudesu.watch/wp-content/uploads/2022/04/Tokyo-24-ku-Sub-Indo.jpg'),
                ),
              ),
              // alignment: Alignment.bottomLeft,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
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
                            '7.2',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Judul Anime',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
