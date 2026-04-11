import 'package:multiple_result/multiple_result.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/plant_info/domain/entities/plant_info_entity.dart';

abstract class PlantInfoRepositoryDomain {
  Future<Result<PlantInfoEntity, Failure>> getPlantDetails({
    required String plantName,
    required String imageUrl,
  });
}
