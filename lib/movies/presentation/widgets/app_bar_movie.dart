import 'package:flutter/material.dart';

/// AppBar for Movies
class AppBarMovies extends StatelessWidget with PreferredSizeWidget {
  /// Constructor
  const AppBarMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(
          left: 12,
          top: 14,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, size: 18),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);
}
