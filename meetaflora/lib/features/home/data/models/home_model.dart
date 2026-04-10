import 'package:meetaflora/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    required int id,
    required String photographer,
    @JsonKey(name: 'src', fromJson: _imageUrlFromJson) required String imageUrl,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}

String _imageUrlFromJson(dynamic json) {
  final map = json as Map<String, dynamic>? ?? {};
  return (map['large2x'] ?? map['large'] ?? map['medium'] ?? '') as String;
}

extension HomeModelMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      photographer: photographer,
      imageUrl: imageUrl,
    );
  }
}
