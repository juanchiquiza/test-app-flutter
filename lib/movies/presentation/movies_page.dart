import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/movies/presentation/widgets/app_bar_movie.dart';
import '/movies/presentation/widgets/movies_list_widget.dart';

///Movies page
class MoviesPage extends ConsumerStatefulWidget {
  ///Constructor
  const MoviesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MoviesPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends ConsumerState<MoviesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarMovies(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: const [
                MoviesListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
