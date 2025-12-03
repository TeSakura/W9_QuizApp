import 'package:flutter/foundation.dart' show kIsWeb;
import 'history_repository.dart';
import 'history_repository_web.dart';

class HistoryService {
  static Future<List<Map<String, dynamic>>> loadHistory() async {
    if (kIsWeb) {
      return HistoryRepositoryWeb.loadHistory();
    }
    return await HistoryRepository.loadHistory();
  }

  static Future<void> saveScore(String quizTitle, int score, int total) async {
    if (kIsWeb) {
      HistoryRepositoryWeb.saveScore(quizTitle, score, total);
    } else {
      await HistoryRepository.saveScore(quizTitle, score, total);
    }
  }
}
