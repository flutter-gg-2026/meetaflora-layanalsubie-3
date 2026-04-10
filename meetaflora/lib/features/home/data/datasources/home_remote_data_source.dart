import 'package:injectable/injectable.dart';
import 'package:meetaflora/core/errors/network_exceptions.dart';
import 'package:meetaflora/core/network/api_endpoints.dart';
import 'package:meetaflora/core/network/dio_client.dart';
import 'package:meetaflora/features/home/data/models/home_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<HomeModel>> searchPlantImages({
    required String query,
    int perPage = 10,
    int page = 1,
  });
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final DioClient _dio;

  HomeRemoteDataSource(this._dio);

  @override
  Future<List<HomeModel>> searchPlantImages({
    required String query,
    int perPage = 10,
    int page = 1,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.searchPhotos,
        queryParameters: {'query': query, 'per_page': perPage, 'page': page},
      );

      final List photos = response.data['photos'] ?? [];

      return photos
          .map((photo) => HomeModel.fromJson(Map<String, dynamic>.from(photo)))
          .toList();

    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
