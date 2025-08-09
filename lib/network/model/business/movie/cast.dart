import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yj_moive/generated/locales.g.dart';

part 'cast.g.dart';

@JsonSerializable(createToJson: false)
class CastersOfMovie {
  @JsonKey(name: 'id')
  final int movieId;
  @JsonKey(name: 'cast')
  final List<Person> casterList;
  @JsonKey(name: 'crew')
  final List<Person> crewList;

  CastersOfMovie({
    required this.movieId,
    required this.casterList,
    required this.crewList,
  });

  factory CastersOfMovie.fromJson(Map<String, dynamic> json) => _$CastersOfMovieFromJson(json);

}

@JsonSerializable(createToJson: false)
class Person {
  final int id;
  final String name;
  @JsonKey(name: 'known_for_department', unknownEnumValue: PersonType.others)
  final PersonType type;
  final Gender gender;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  // 以下字段只有详情接口才有
  final String? biography;
  final String? birthday;

  Person({
    required this.id,
    required this.name,
    required this.type,
    required this.gender,
    required this.profilePath,
    required this.biography,
    required this.birthday,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
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

enum PersonType {
  @JsonValue('Acting')
  actor,
  @JsonValue('Directing')
  director,
  @JsonValue('Writing')
  writer,
  @JsonValue('Production')
  producer,
  others,
}

extension PersonTypeExtension on PersonType {
  String get displayName {
    switch (this) {
      case PersonType.actor:
        return LocaleKeys.actor.tr;
      case PersonType.director:
        return LocaleKeys.director.tr;
      case PersonType.writer:
        return LocaleKeys.writer.tr;
      case PersonType.producer:
        return LocaleKeys.producer.tr;
      default:
        return LocaleKeys.other.tr;
    }
  }
}
