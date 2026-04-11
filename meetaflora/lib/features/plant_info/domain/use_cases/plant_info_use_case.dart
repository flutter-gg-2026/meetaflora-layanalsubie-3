import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/plant_info/domain/entities/plant_info_entity.dart';
import 'package:meetaflora/features/plant_info/domain/repositories/plant_info_repository_domain.dart';

@lazySingleton
class PlantInfoUseCase {
  final PlantInfoRepositoryDomain _repositoryData;

  PlantInfoUseCase(this._repositoryData);

  Future<Result<PlantInfoEntity, Failure>> getPlantInfo({
    required String plantName,
    required String imageUrl,
  }) {
    return _repositoryData.getPlantDetails(
      plantName: plantName,
      imageUrl: imageUrl,
    );
  }
}
