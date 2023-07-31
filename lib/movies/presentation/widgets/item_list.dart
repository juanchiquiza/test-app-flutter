import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/movies/domain/entities/movie.dart';

/// Item List for Movies
class ItemList extends StatelessWidget {
  /// Constructor
  const ItemList({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(movie.name ?? ''),
        content: SizedBox(
          height: 70,
          child: CachedNetworkImage(
            key: const Key('UrlImage'),
            imageUrl: '${movie.thumbnail?.path}.${movie.thumbnail?.extension}',
            width: 60,
            height: 60,
          ),
        ),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 70,
        child: GestureDetector(
          onTap: () {
            showAlertDialog(context);
          },
          child: Row(
            children: [
              CachedNetworkImage(
                key: const Key('UrlImage'),
                imageUrl:
                    '${movie.thumbnail?.path}.${movie.thumbnail?.extension}',
                width: 60,
                height: 60,
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
      ),
    );
  }
}
