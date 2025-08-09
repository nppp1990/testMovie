// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastersOfMovie _$CastersOfMovieFromJson(Map<String, dynamic> json) =>
    CastersOfMovie(
      movieId: (json['id'] as num).toInt(),
      casterList: (json['cast'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      crewList: (json['crew'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: $enumDecode(
    _$PersonTypeEnumMap,
    json['known_for_department'],
    unknownValue: PersonType.others,
  ),
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  profilePath: json['profile_path'] as String?,
  biography: json['biography'] as String?,
  birthday: json['birthday'] as String?,
  birthPlace: json['place_of_birth'] as String?,
);

const _$PersonTypeEnumMap = {
  PersonType.actor: 'Acting',
  PersonType.director: 'Directing',
  PersonType.writer: 'Writing',
  PersonType.producer: 'Production',
  PersonType.others: 'others',
};

const _$GenderEnumMap = {
  Gender.none: 0,
  Gender.female: 1,
  Gender.male: 2,
  Gender.nonBinary: 3,
};
