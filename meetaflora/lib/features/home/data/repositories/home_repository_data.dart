
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:meetaflora/core/errors/network_exceptions.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/home/domain/entities/home_entity.dart';

import 'package:meetaflora/features/home/data/datasources/home_remote_data_source.dart';
import 'package:meetaflora/features/home/data/models/home_model.dart';
import 'package:meetaflora/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain{
  final BaseHomeRemoteDataSource remoteDataSource;


  HomeRepositoryData(this.remoteDataSource);

@override
  Future<Result<HomeEntity, Failure>> getHome() async {
    try {
      final response = await remoteDataSource.getHome();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
