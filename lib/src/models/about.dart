import 'package:flutter_cv/src/models/education.dart';
import 'package:json_annotation/json_annotation.dart';

import 'experience.dart';
import 'skill.dart';

part 'about.g.dart';

@JsonSerializable()
class About {
  @JsonKey(name: 'educations')
  List<Education> educations;

  @JsonKey(name: 'experience')
  List<Experience> experiences;

  @JsonKey(name: 'skills')
  List<Skill> skills;

  About({
    this.educations,
    this.experiences,
    this.skills,
  });

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}
