import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable(createToJson: false)
class MovieCaster {
  final int id;
  final String name;
  @JsonKey(name: 'profile_path')
  final String profilePath;

  MovieCaster(this.id, this.name, this.profilePath);

  factory MovieCaster.fromJson(Map<String, dynamic> json) => _$MovieCasterFromJson(json);
}

@JsonSerializable(createToJson: false)
class CastersOfMovie {
  @JsonKey(name: 'id')
  final String movieId;
  @JsonKey(name: 'cast')
  final List<MovieCaster> casterList;

  factory CastersOfMovie.fromJson(Map<String, dynamic> json) => _$CastersOfMovieFromJson(json);

  CastersOfMovie({required this.movieId, required this.casterList});
}

@JsonSerializable(createToJson: false)
class Caster {
  final int id;
  final String name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final String biography;
  final String birthday;
  final Gender gender;

  Caster({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.biography,
    required this.birthday,
    required this.gender,
  });

  factory Caster.fromJson(Map<String, dynamic> json) => _$CasterFromJson(json);
}

/// https://developer.themoviedb.org/reference/person-details
enum Gender {
  @JsonValue(0)
  none,
  @JsonValue(1)
  female,
  @JsonValue(2)
  male,
  @JsonValue(3)
  nonBinary,
}
