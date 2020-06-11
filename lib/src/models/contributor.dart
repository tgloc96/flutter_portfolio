import 'package:json_annotation/json_annotation.dart';

part 'contributor.g.dart';

@JsonSerializable()
class Contributor {

  @JsonKey(name: 'url_icon_app', includeIfNull: false)
  final String urlIconApp;

  @JsonKey(name: 'url', includeIfNull: false)
  final String url;

  Contributor({
    this.urlIconApp,
    this.url,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) =>
      _$ContributorFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorToJson(this);
}
