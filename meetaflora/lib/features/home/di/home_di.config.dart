// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:meetaflora/core/network/dio_client.dart' as _i581;
import 'package:meetaflora/features/home/data/datasources/home_remote_data_source.dart'
    as _i118;
import 'package:meetaflora/features/home/data/repositories/home_repository_data.dart'
    as _i854;
import 'package:meetaflora/features/home/domain/repositories/home_repository_domain.dart'
    as _i918;
import 'package:meetaflora/features/home/domain/use_cases/home_use_case.dart'
    as _i841;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i118.BaseHomeRemoteDataSource>(
      () => _i118.HomeRemoteDataSource(gh<_i581.DioClient>()),
    );
    gh.lazySingleton<_i918.HomeRepositoryDomain>(
      () => _i854.HomeRepositoryData(gh<_i118.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i841.HomeUseCase>(
      () => _i841.HomeUseCase(gh<_i918.HomeRepositoryDomain>()),
    );
    return this;
  }
}
