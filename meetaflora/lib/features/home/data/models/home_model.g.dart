// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
  id: (json['id'] as num).toInt(),
  photographer: json['photographer'] as String,
  alt: json['alt'] as String,
  src: Map<String, String>.from(json['src'] as Map),
);

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photographer': instance.photographer,
      'alt': instance.alt,
      'src': instance.src,
    };
