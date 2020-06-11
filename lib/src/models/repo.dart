import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;

  @JsonKey(name: 'url_repo', includeIfNull: false)
  final String urlRepo;

  @JsonKey(name: 'type_repo', includeIfNull: false)
  final String typeRepo;

  Repo({
    this.name,
    this.urlRepo,
    this.typeRepo,
  });

  factory Repo.fromJson(Map<String, dynamic> json) =>
      _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
