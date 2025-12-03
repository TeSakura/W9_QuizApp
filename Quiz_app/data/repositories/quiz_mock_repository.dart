import 'dart:convert';
import '../../models/quiz.dart';

class QuizMockRepository {
  static Future<Quiz> loadQuiz() async {
    final jsonString = _mockJson;
    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    return Quiz.fromJson(data);
  }
}

const _mockJson = '''
{
  "title": "General Knowledge - W9 Quiz",
  "questions": [
    {
      "text": "What is the capital of France?",
      "options": ["Paris", "London", "Berlin", "Madrid"],
      "correctIndex": 0
    },
    {
      "text": "Which planet is known as the Red Planet?",
      "options": ["Venus", "Saturn", "Mars", "Jupiter"],
      "correctIndex": 2
    },
    {
      "text": "What is 5 + 7?",
      "options": ["10", "11", "12", "13"],
      "correctIndex": 2
    }
  ]
}
''';
