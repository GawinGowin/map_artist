// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtRecord _$$_ArtRecordFromJson(Map<String, dynamic> json) => _$_ArtRecord(
      json['key'] as String,
      PointsRecord.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArtRecordToJson(_$_ArtRecord instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

_$_PointsRecord _$$_PointsRecordFromJson(Map<String, dynamic> json) =>
    _$_PointsRecord(
      title: json['title'] as String,
      points: json['points'] as List<dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_PointsRecordToJson(_$_PointsRecord instance) =>
    <String, dynamic>{
      'title': instance.title,
      'points': instance.points,
      'createdAt': instance.createdAt.toIso8601String(),
    };
