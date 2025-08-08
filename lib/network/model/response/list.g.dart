// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseList<T> _$BaseListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BaseList<T>(
  page: (json['page'] as num).toInt(),
  data: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
  total: (json['total_results'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);
