class QuizResponse {
  final int responseCode;
  final List<Question> results;

  QuizResponse({required this.responseCode, required this.results});

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      responseCode: json['response_code'],
      results: (json['results'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }
}

class Question {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }
}

