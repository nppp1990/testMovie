import 'package:json_annotation/json_annotation.dart';
import 'package:yj_moive/service/image_extension.dart';

part 'movie.g.dart';

@JsonSerializable(createToJson: false)
class Movie {
  final int id;
  final String title;
  final String overview;

  @JsonKey(name: 'release_date')
  // 格式：2025-07-24
  final String releaseDate;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  // minutes 列表接口拿不到这个值，需要详情接口才可以拿到
  final int? runtime;

  @JsonKey(name: 'poster_path')
  final String? posterImage;
  @JsonKey(name: 'backdrop_path')
  final String? backdropImage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
    required this.posterImage,
    required this.backdropImage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  String get imageUrl => posterImage?.posterImage ?? backdropImage?.backdropImage ?? '';
}

@JsonSerializable(createToJson: false)
class MoviesOfCaster {
  final String id;
  @JsonKey(name: 'cast')
  final List<Movie> castMovies;

  // final List<Movie> crewMovies;

  MoviesOfCaster({required this.id, required this.castMovies});

  factory MoviesOfCaster.fromJson(Map<String, dynamic> json) => _$MoviesOfCasterFromJson(json);
}
