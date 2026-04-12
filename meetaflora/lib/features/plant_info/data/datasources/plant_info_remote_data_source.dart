import 'dart:convert';
import 'dart:developer';
import 'dart:io';

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

    final url = "Your Key cURL";

    Map<String, dynamic> imagePart;
    if (imageUrl.startsWith('http')) {
      imagePart = {"text": "Identify this plant from URL: $imageUrl"};
    } else {
      final bytes = await File(imageUrl).readAsBytes();
      imagePart = {
        "inline_data": {
          "mime_type": "image/jpeg",
          "data": base64Encode(bytes),
        },
      };
    }

    final response = await _dio.post(
      url,
      data: {
        "contents": [
          {
            "parts": [
              {
                "text": "Analyze the plant: $plantName. Return botanical info strictly as a JSON object with these keys: plantName, description, careTips, funFact."
              },
              imagePart,
            ]
          }
        ],
      },
    );

    if (response.data['candidates'] != null) {
      String outputText = response.data['candidates'][0]['content']['parts'][0]['text'];
      
      outputText = outputText.replaceAll('```json', '').replaceAll('```', '').trim();
      
      final Map<String, dynamic> jsonMap = jsonDecode(outputText);
      return PlantInfoModel.fromJson(jsonMap);
    }
    throw Exception("No data found");

  } catch (error) {
    if (error is DioException) {
      log("REASON FROM SERVER: ${error.response?.data}");
    }
    throw FailureExceptions.getException(error);
  }
}
}

