// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) {
  return Education(
    organization: json['organization'] as String,
    time: json['time'] as String,
    knowledge: json['knowledge'] as String,
  );
}

Map<String, dynamic> _$EducationToJson(Education instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('organization', instance.organization);
  writeNotNull('time', instance.time);
  writeNotNull('knowledge', instance.knowledge);
  return val;
}
