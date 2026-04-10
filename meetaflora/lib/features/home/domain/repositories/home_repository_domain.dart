import 'package:multiple_result/multiple_result.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
  Future<Result<List<HomeEntity>, Failure>> searchPlantImages({
    required String query,
    int perPage = 10,
    int page = 1,
  });
}