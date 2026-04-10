import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/home/domain/entities/home_entity.dart';
import 'package:meetaflora/features/home/domain/repositories/home_repository_domain.dart';

@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repositoryData;

  HomeUseCase(this._repositoryData);

  Future<Result<List<HomeEntity>, Failure>> searchPlantImages({
    required String query,
    int perPage = 10,
    int page = 1,
  }) async {
    return _repositoryData.searchPlantImages(
      query: query,
      perPage: perPage,
      page: page,
    );
  }
}