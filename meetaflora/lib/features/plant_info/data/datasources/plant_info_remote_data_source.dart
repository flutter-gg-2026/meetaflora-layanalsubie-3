import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:meetaflora/core/network/api_endpoints.dart';
import 'package:meetaflora/core/network/openai_dio_client.dart';
import 'package:meetaflora/features/plant_info/data/models/plant_info_model.dart';
import 'package:meetaflora/core/errors/network_exceptions.dart';

abstract class BasePlantInfoRemoteDataSource {
  Future<PlantInfoModel> getPlantDetails({
    required String plantName,
    required String imageUrl,
  });
}

@LazySingleton(as: BasePlantInfoRemoteDataSource)
class PlantInfoRemoteDataSource implements BasePlantInfoRemoteDataSource {
  final OpenAiDioClient _dio;

  PlantInfoRemoteDataSource(this._dio);

  @override
  Future<PlantInfoModel> getPlantDetails({
    required String plantName,
    required String imageUrl,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.responses,
        data: {
          "model": "gpt-4.1-mini",
          "input": [
            {
              "role": "user",
              "content": [
                {
                  "type": "input_text",
                  "text":
                      "You are helping inside a plant app. Return concise botanical app content for the plant named '$plantName'. Use the image only as extra context. Respond strictly in the required JSON schema. Keep each field short and friendly.",
                },
                {"type": "input_image", "image_url": imageUrl},
              ],
            },
          ],
          "text": {
            "format": {
              "type": "json_schema",
              "name": "plant_details",
              "strict": true,
              "schema": {
                "type": "object",
                "properties": {
                  "plantName": {"type": "string"},
                  "description": {"type": "string"},
                  "careTips": {"type": "string"},
                  "funFact": {"type": "string"},
                },
                "required": ["plantName", "description", "careTips", "funFact"],
                "additionalProperties": false,
              },
            },
          },
        },
      );

      final String outputText = response.data['output_text'] ?? '{}';
      final Map<String, dynamic> jsonMap = jsonDecode(outputText);

      return PlantInfoModel.fromJson(jsonMap);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
