import 'package:json_annotation/json_annotation.dart';

import '../../model/meta.dart';

part 'base_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class BaseResponse<T> {
  @JsonKey(name: 'meta')
  final Meta? meta;
  @JsonKey(name: 'events')
  final T? events;

  dynamic error;

  BaseResponse({this.meta, this.events, this.error});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
