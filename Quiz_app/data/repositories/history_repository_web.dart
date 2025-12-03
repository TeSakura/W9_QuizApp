import 'dart:convert';
import 'dart:html' as html;

class HistoryRepositoryWeb {
  static const _key = "quiz_history";

  static List<Map<String, dynamic>> loadHistory() {
    final raw = html.window.localStorage[_key];
    if (raw == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(raw));
  }

  static void saveScore(String quizTitle, int score, int total) {
    final history = loadHistory();

    history.add({
      "quiz": quizTitle,
      "score": score,
      "total": total,
      "time": DateTime.now().toIso8601String(),
    });

    html.window.localStorage[_key] = jsonEncode(history);
  }
}
