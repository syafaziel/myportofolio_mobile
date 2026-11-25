import 'package:json_annotation/json_annotation.dart';

part 'volunteering.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Volunteering {
  const Volunteering({
    required this.title,
    required this.description,
    required this.category,
    this.thumbnail = '',
    this.endedAt,
    this.id,
    this.startedAt,
    this.isOngoing = false,
    this.starCount = 0,
    this.isStarred = false,
    this.starredByNames = const [],
  });

  factory Volunteering.fromJson(Map<String, dynamic> json) =>
      _$VolunteeringFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String title;
  final String description;
  final String category;

  @JsonKey(defaultValue: '')
  final String thumbnail;

  final DateTime? endedAt;

  @JsonKey(includeToJson: false)
  final DateTime? startedAt;

  @JsonKey(includeToJson: false)
  final bool isOngoing;

  @JsonKey(includeToJson: false)
  final int starCount;

  @JsonKey(includeToJson: false)
  final bool isStarred;

  @JsonKey(fromJson: _parseStringList)
  final List<String> starredByNames;

  Map<String, dynamic> toJson() => _$VolunteeringToJson(this);
}

List<String> _parseStringList(dynamic value) {
  if (value is List) {
    return value.map((item) => item.toString()).toList();
  }

  if (value == null || value == '') {
    return [];
  }

  if (value is String) {
    return [value];
  }

  return [];
}
