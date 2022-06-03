// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      total: json['total'] as int?,
      took: json['took'] as int?,
      page: json['page'] as int?,
      per_page: json['per_page'] as int?,
      geolocation: (json['geolocation'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'total': instance.total,
      'took': instance.took,
      'page': instance.page,
      'per_page': instance.per_page,
      'geolocation': instance.geolocation,
    };
