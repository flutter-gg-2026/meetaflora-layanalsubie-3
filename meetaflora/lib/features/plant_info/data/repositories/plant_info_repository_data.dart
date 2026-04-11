import 'package:injectable/injectable.dart';
import 'package:meetaflora/core/errors/network_exceptions.dart';
import 'package:meetaflora/features/plant_info/data/models/plant_info_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/plant_info/domain/entities/plant_info_entity.dart';

import 'package:meetaflora/features/plant_info/data/datasources/plant_info_remote_data_source.dart';
import 'package:meetaflora/features/plant_info/domain/repositories/plant_info_repository_domain.dart';

@LazySingleton(as: PlantInfoRepositoryDomain)
class PlantInfoRepositoryData implements PlantInfoRepositoryDomain {
  final BasePlantInfoRemoteDataSource remoteDataSource;

  PlantInfoRepositoryData(this.remoteDataSource);

  @override
  Future<Result<PlantInfoEntity, Failure>> getPlantDetails({
    required String plantName,
    required String imageUrl,
  }) async{
    try {
      final model = await remoteDataSource.getPlantDetails(
        plantName: plantName,
        imageUrl: imageUrl,
      );

      return Success(model.toEntity());
    } on Failure catch (failure) {
      return Error(failure);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
