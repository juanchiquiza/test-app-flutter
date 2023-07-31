import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/movies/presentation/widgets/item_list.dart';
import '/movies/presentation/widgets/loading_movies_list_widget.dart';
import '/movies/application/providers/movies/movies_providers.dart';
import '/movies/presentation/widgets/retry_column.dart';

/// Widget that Movie List
class MoviesListWidget extends ConsumerStatefulWidget {
  ///Constructor
  const MoviesListWidget({super.key});

  @override
  ConsumerState createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends ConsumerState<MoviesListWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _getMovies();
    });
  }

  /// Call notifier to fetch the data to display
  /// Get Movies
  void _getMovies() {
    ref.read(moviesNotifierProvider.notifier).getMovies();
  }

  @override
  Widget build(BuildContext context) {
    final launchState = ref.watch(
      moviesNotifierProvider,
    );
    return launchState.maybeWhen(
      error: (_) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(top: 30),
        child: RetryColumnWidget(
          onTap: _getMovies,
        ),
      ),
      loading: () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: const LoadingMoviesListWidget(),
      ),
      data: (data) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView.builder(
            key: const Key('moviesList'),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final movie = data[index];
              return ItemList(movie: movie);
            },
          ),
        );
      },
      orElse: () => const SizedBox(),
    );
  }
}
