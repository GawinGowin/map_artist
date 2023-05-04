import 'package:freezed_annotation/freezed_annotation.dart';

// flutter pub run build_runner watch で CodeGenerating

part 'points.freezed.dart';
part 'points.g.dart';

@freezed
class ArtRecord with _$ArtRecord {
  factory ArtRecord(
    String key,
    PointsRecord value,
  ) = _ArtRecord;
  factory ArtRecord.fromJson(Map<String, dynamic> json) => _$ArtRecordFromJson(json);
}

@freezed
class PointsRecord with _$PointsRecord {
  factory PointsRecord({
    required String title,
    required List points,
    required DateTime createdAt,
  }) = _PointsRecord;

  factory PointsRecord.fromJson(Map<String, dynamic> json) => _$PointsRecordFromJson(json);
}