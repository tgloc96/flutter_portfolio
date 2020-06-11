// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo(
    name: json['name'] as String,
    urlRepo: json['url_repo'] as String,
    typeRepo: json['type_repo'] as String,
  );
}

Map<String, dynamic> _$RepoToJson(Repo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('url_repo', instance.urlRepo);
  writeNotNull('type_repo', instance.typeRepo);
  return val;
}
