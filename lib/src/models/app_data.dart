import 'package:flutter_cv/src/models/about.dart';
import 'package:json_annotation/json_annotation.dart';

import 'home.dart';

part 'app_data.g.dart';

@JsonSerializable()
class AppData {
  @JsonKey(name: 'home', includeIfNull: false)
  final Home home;

  @JsonKey(name: 'about', includeIfNull: false)
  final About about;

  AppData({
    this.home,
    this.about,
  });

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
