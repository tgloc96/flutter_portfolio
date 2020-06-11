// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
    urlAvatar: json['url_avatar'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    description: json['description'] as String,
    contributors: (json['contributors'] as List)
        ?.map((e) =>
            e == null ? null : Contributor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    contact: json['contact'] == null
        ? null
        : Contact.fromJson(json['contact'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeToJson(Home instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url_avatar', instance.urlAvatar);
  writeNotNull('title', instance.title);
  writeNotNull('subtitle', instance.subtitle);
  writeNotNull('description', instance.description);
  writeNotNull('contributors', instance.contributors);
  writeNotNull('contact', instance.contact);
  return val;
}
