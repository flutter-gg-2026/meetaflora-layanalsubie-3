
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:meetaflora/core/errors/failure.dart';
import 'package:meetaflora/features/home/domain/entities/home_entity.dart';

import 'package:meetaflora/features/home/data/datasources/home_remote_data_source.dart';
import 'package:meetaflora/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain{
  final BaseHomeRemoteDataSource remoteDataSource;


  HomeRepositoryData(this.remoteDataSource);
  
  @override
  Future<Result<HomeEntity, Failure>> getHome() {
    // TODO: implement getHome
    throw UnimplementedError();
  }

}
