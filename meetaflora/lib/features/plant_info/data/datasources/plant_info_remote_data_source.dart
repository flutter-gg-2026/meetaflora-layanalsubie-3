import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
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
  final Dio _dio;

  PlantInfoRemoteDataSource(this._dio);

  @override
  Future<PlantInfoModel> getPlantDetails({
    required String plantName,
    required String imageUrl,
  }) async {
    try {
      final key = dotenv.env['gemini_key']?.trim() ?? '';

      final url =
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent";

      final response = await _dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': key, 
          },
        ),
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text":
                      "Identify the plant '$plantName'. Return ONLY a JSON object with keys: plantName, description, careTips, funFact.",
                },
              ],
            },
          ],
          "generationConfig": {"response_mime_type": "application/json"},
        },
      );

      if (response.data['candidates'] != null) {
        final String outputText =
            response.data['candidates'][0]['content']['parts'][0]['text'];
        final Map<String, dynamic> jsonMap = jsonDecode(outputText.trim());
        return PlantInfoModel.fromJson(jsonMap);
      }
      throw Exception("No data found");
    } catch (error) {
      if (error is DioException) {
        log("Gemini Full Error: ${error.response?.data}");
      }
      throw FailureExceptions.getException(error);
    }
  }
}
