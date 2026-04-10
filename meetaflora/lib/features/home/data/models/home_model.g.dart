// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
  id: (json['id'] as num).toInt(),
  photographer: json['photographer'] as String,
  imageUrl: _imageUrlFromJson(json['src']),
);

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photographer': instance.photographer,
      'src': instance.imageUrl,
    };
