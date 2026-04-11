// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:meetaflora/features/plant_info/data/datasources/plant_info_remote_data_source.dart'
    as _i896;
import 'package:meetaflora/features/plant_info/data/repositories/plant_info_repository_data.dart'
    as _i24;
import 'package:meetaflora/features/plant_info/domain/repositories/plant_info_repository_domain.dart'
    as _i969;
import 'package:meetaflora/features/plant_info/domain/use_cases/plant_info_use_case.dart'
    as _i621;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initPlantInfo({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i896.BasePlantInfoRemoteDataSource>(
      () => _i896.PlantInfoRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i969.PlantInfoRepositoryDomain>(
      () => _i24.PlantInfoRepositoryData(
        gh<_i896.BasePlantInfoRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i621.PlantInfoUseCase>(
      () => _i621.PlantInfoUseCase(gh<_i969.PlantInfoRepositoryDomain>()),
    );
    return this;
  }
}
