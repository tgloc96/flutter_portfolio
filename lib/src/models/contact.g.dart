// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    phone: json['phone'] as String,
    email: json['email'] as String,
    repo: json['repo'] == null
        ? null
        : Repo.fromJson(json['repo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('repo', instance.repo);
  return val;
}
