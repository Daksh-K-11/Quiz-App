import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question.dart';

class QuizService {
  static const String apiUrl = 'https://opentdb.com/api.php?amount=10';

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'] as List;
      return results.map((questionJson) => Question.fromJson(questionJson)).toList();
    } else {
      throw Exception('Failed to load quiz questions');
    }
  }
}