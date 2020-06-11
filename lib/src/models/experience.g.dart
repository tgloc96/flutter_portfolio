// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return Experience(
    position: json['position'] as String,
    organization: json['organization'] as String,
    time: json['time'] as String,
    skills: (json['skills'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ExperienceToJson(Experience instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  writeNotNull('organization', instance.organization);
  writeNotNull('time', instance.time);
  writeNotNull('skills', instance.skills);
  return val;
}
