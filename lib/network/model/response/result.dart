import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

/// 接口成功时返回T
/// 接口失败时返回
/// {
// "status_code": 7,
// "status_message": "Invalid API key: You must be granted a valid key.",
// "success": false
// }
class NetResult<T> {
  final ResultInfo? resultInfo;
  final T? data;

  NetResult({this.resultInfo, this.data});

  factory NetResult.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    // 由于movie db的接口成功和失败时返回的json结构不一致，所以需要这么处理
    if (json.containsKey('success') && json.containsKey('status_code')) {
      return NetResult(
        resultInfo: ResultInfo.fromJson(json),
      );
    } else {
      return NetResult(
        data: fromJsonT(json),
      );
    }
  }
}

@JsonSerializable(createToJson: false)
class ResultInfo {
  final int code;
  final String message;
  final bool success;

  ResultInfo({required this.code, required this.message, required this.success});

  factory ResultInfo.fromJson(Map<String, dynamic> json) => _$ResultInfoFromJson(json);
}
