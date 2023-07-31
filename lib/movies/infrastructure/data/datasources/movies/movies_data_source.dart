import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import '/movies/infrastructure/data/datasources/movies/movies_data_const.dart';
import '/movies/infrastructure/data/models/movie_dto.dart';
import '/core/infrastructure/http/exception.dart';
import '/core/infrastructure/http/status_code.dart';
import '/core/infrastructure/datasources/data_source_base.dart';
import '/core/shared/constants.dart';

/// Movies Data Source
abstract class MoviesDataSource {
  /// A function that returns a Future of List<MovieDTO>
  Future<List<MovieDTO>> getMovies();
}

/// Implementation of Movies Data Source
class MoviesDataSourceImpl implements MoviesDataSource {
  /// Constructor
  MoviesDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<MovieDTO>> getMovies() async {
    return DataSourceBase<List<MovieDTO>>().serverRequest(() async {
      final timestamp = DateTime.now().toString();
      String md5Convert = md5
          .convert(utf8.encode(timestamp +
              'f48e8d4200751016fccc775febb45a558aa590dc' +
              '95ff98cb37a56ca66e9ae1356ac848a9'))
          .toString();

      Map<String, dynamic> queryParameters = {
        "hash": md5Convert,
        "ts": timestamp,
        "apikey": '95ff98cb37a56ca66e9ae1356ac848a9',
      };

      final requestUri = Uri.https(
        EnvironmentConstants.development.value,
        MoviesDataConst.movieDataConstEndPoint.value,
        queryParameters,
      );
      final response = await _dio.getUri(
        requestUri,
      );

      if (response.statusCode == StatusCode.ok) {
        if (response.data['data']['results'] is List) {
          return (response.data['data']['results'] as List)
              .map<MovieDTO>((value) {
            return MovieDTO.fromJson(value);
          }).toList();
        } else {
          throw const DataException(
            serverErrorMessage,
          );
        }
      } else {
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    });
  }
}
