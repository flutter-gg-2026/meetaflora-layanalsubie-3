import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GeminiClient {
  late final GenerativeModel _model;

  GeminiClient() {
    final key = dotenv.env['gemini_key'] ?? '';

    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: key,
      requestOptions: const RequestOptions(apiVersion: 'v1'),
    );
  }

  GenerativeModel get model => _model;
}
