import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill {
  @JsonKey(name: 'title', includeIfNull: false)
  final String title;

  @JsonKey(name: 'value', includeIfNull: false)
  final int value;

  Skill({
    this.title,
    this.value,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
