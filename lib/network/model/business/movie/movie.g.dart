// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  releaseDate: json['release_date'] as String,
  voteAverage: (json['vote_average'] as num).toDouble(),
  runtime: (json['runtime'] as num?)?.toInt(),
  posterImage: json['poster_path'] as String?,
  backdropImage: json['backdrop_path'] as String?,
);

MoviesOfCaster _$MoviesOfCasterFromJson(Map<String, dynamic> json) =>
    MoviesOfCaster(
      id: json['id'] as String,
      castMovies: (json['cast'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
