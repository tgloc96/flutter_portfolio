import 'package:flutter_cv/src/models/contact.dart';
import 'package:flutter_cv/src/models/contributor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  @JsonKey(name: 'url_avatar', includeIfNull: false)
  final String urlAvatar;

  @JsonKey(name: 'title', includeIfNull: false)
  final String title;

  @JsonKey(name: 'subtitle', includeIfNull: false)
  final String subtitle;

  @JsonKey(name: 'description', includeIfNull: false)
  final String description;

  @JsonKey(name: 'contributors', includeIfNull: false)
  final List<Contributor> contributors;

  @JsonKey(name: 'contact', includeIfNull: false)
  final Contact contact;

  Home({
    this.urlAvatar,
    this.title,
    this.subtitle,
    this.description,
    this.contributors,
    this.contact,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}
