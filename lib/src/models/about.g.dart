// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) {
  return About(
    educations: (json['educations'] as List)
        ?.map((e) =>
            e == null ? null : Education.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    experiences: (json['experience'] as List)
        ?.map((e) =>
            e == null ? null : Experience.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    skills: (json['skills'] as List)
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'educations': instance.educations,
      'experience': instance.experiences,
      'skills': instance.skills,
    };
