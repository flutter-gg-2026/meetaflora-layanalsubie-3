import 'package:meetaflora/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    required int id,
    required String photographer,
    required String alt,
    required Map<String, String> src,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
extension HomeModelMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      photographer: photographer,
      imageUrl: src['original'] ?? src['large2x'] ?? '',
      alt: alt,
    );
  }
}
