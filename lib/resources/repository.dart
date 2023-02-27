import 'dart:async';
import 'package:teve/Home/models/channel_model.dart';

import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<List<ChannelModel>> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}