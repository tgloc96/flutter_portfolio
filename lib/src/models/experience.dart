import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable()
class Experience {
  @JsonKey(name: 'position', includeIfNull: false)
  final String position;

  @JsonKey(name: 'organization', includeIfNull: false)
  final String organization;

  @JsonKey(name: 'time', includeIfNull: false)
  final String time;

  @JsonKey(name: 'skills', includeIfNull: false)
  final List<String> skills;

  Experience({
    this.position,
    this.organization,
    this.time,
    this.skills,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
