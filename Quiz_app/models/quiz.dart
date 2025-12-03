class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});

  int computeScore(List<int?> answers) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      final ans = (i < answers.length) ? answers[i] : null;
      if (ans != null && ans == questions[i].correctIndex) score++;
    }
    return score;
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      title: json['title'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'] as String,
      options: List<String>.from(json['options'] as List<dynamic>),
      correctIndex: json['correctIndex'] as int,
    );
  }
}
