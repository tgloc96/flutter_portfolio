// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) {
  return AppData(
    home: json['home'] == null
        ? null
        : Home.fromJson(json['home'] as Map<String, dynamic>),
    about: json['about'] == null
        ? null
        : About.fromJson(json['about'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppDataToJson(AppData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('home', instance.home);
  writeNotNull('about', instance.about);
  return val;
}
