import 'package:json_annotation/json_annotation.dart';

part 'list.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseList<T> {
  // 当前页码
  final int page;
  @JsonKey(name: 'results')
  final List<T> data;
  @JsonKey(name: 'total_results')
  // 总结果数
  final int total;
  @JsonKey(name: 'total_pages')
  // 总页数
  final int totalPages;

  BaseList({required this.page, required this.data, required this.total, required this.totalPages});

  factory BaseList.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseListFromJson(json, fromJsonT);

}
