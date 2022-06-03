import 'package:json_annotation/json_annotation.dart';
part 'meta.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Meta {
  final int? total;
  final int? took;
  final int? page;
  final int? per_page;
  final double? geolocation;


  Meta({this.total, this.took, this.page, this.per_page, this.geolocation});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
