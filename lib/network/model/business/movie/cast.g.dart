// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCaster _$MovieCasterFromJson(Map<String, dynamic> json) => MovieCaster(
  (json['id'] as num).toInt(),
  json['name'] as String,
  json['profile_path'] as String,
);

CastersOfMovie _$CastersOfMovieFromJson(Map<String, dynamic> json) =>
    CastersOfMovie(
      movieId: json['id'] as String,
      casterList: (json['cast'] as List<dynamic>)
          .map((e) => MovieCaster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Caster _$CasterFromJson(Map<String, dynamic> json) => Caster(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  profilePath: json['profile_path'] as String?,
  biography: json['biography'] as String,
  birthday: json['birthday'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
);

const _$GenderEnumMap = {
  Gender.none: 0,
  Gender.female: 1,
  Gender.male: 2,
  Gender.nonBinary: 3,
};
