import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/movies/domain/entities/movie.dart';

/// Item List for Albums
class ItemList extends StatelessWidget {
  /// Constructor
  const ItemList({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            CachedNetworkImage(
              key: const Key('UrlImage'),
              imageUrl:
                  '${movie.thumbnail?.path}.${movie.thumbnail?.extension}',
              width: 60,
              height: 60,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                movie.name ?? '',
                key: const Key('TitleText'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
