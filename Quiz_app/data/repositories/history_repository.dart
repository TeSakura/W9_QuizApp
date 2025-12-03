import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HistoryRepository {
  static Future<File?> _file() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      return File('${dir.path}/history.json');
    } catch (e) {
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> loadHistory() async {
    final f = await _file();
    if (f == null) return [];

    if (!await f.exists()) return [];

    final jsonStr = await f.readAsString();
    return List<Map<String, dynamic>>.from(jsonDecode(jsonStr));
  }

  static Future<void> saveScore(String quizTitle, int score, int total) async {
    final f = await _file();
    if (f == null) return;

    List<Map<String, dynamic>> history = [];

    if (await f.exists()) {
      history = List<Map<String, dynamic>>.from(
        jsonDecode(await f.readAsString()),
      );
    }

    history.add({
      "quiz": quizTitle,
      "score": score,
      "total": total,
      "time": DateTime.now().toIso8601String(),
    });

    await f.writeAsString(jsonEncode(history));
  }
}
