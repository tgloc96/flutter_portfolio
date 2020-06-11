import 'package:flutter_cv/src/models/repo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: 'phone', includeIfNull: false)
  final String phone;

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;

  @JsonKey(name: 'repo', includeIfNull: false)
  final Repo repo;

  Contact({
    this.phone,
    this.email,
    this.repo,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

}
