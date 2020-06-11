import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable()
class Education {
  @JsonKey(name: 'organization', includeIfNull: false)
  final String organization;

  @JsonKey(name: 'time', includeIfNull: false)
  final String time;

  @JsonKey(name: 'knowledge', includeIfNull: false)
  final String knowledge;

  Education({
    this.organization,
    this.time,
    this.knowledge,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
