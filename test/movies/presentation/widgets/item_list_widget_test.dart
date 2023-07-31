import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:test_app/movies/domain/entities/movie.dart';
import 'package:test_app/movies/presentation/widgets/item_list.dart';

import '../../../fixture/fixture.dart';

void main() {
  group('MoviesListWidget', () {
    const titleText = 'test';
    const movie = Movie(
      id: 1,
      name: 'test',
    );
    const testNormalWidget = ItemList(movie: movie);

    testWidgets('Should render correctly', (tester) async {
      // arrange
      await pumpMaterialApp(tester, testNormalWidget);
      // act and assert
      expect(find.byType(ItemList), findsOneWidget);
    });

    testWidgets('Should render the url image property', (tester) async {
      // arrange
      await pumpMaterialApp(tester, testNormalWidget);
      // act and assert
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byKey(const Key('UrlImage')), findsOneWidget);
    });

    testWidgets('Should render the test property', (tester) async {
      // arrange
      await pumpMaterialApp(tester, testNormalWidget);
      // act and assert
      expect(find.text(titleText), findsOneWidget);
      expect(find.byKey(const Key('TitleText')), findsOneWidget);
    });
  });
}
