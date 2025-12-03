import 'package:flutter/material.dart';
import 'data/repositories/quiz_mock_repository.dart';
import 'models/quiz.dart';
import 'ui/screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final quiz = await QuizMockRepository.loadQuiz();
  runApp(QuizApp(quiz: quiz));
}

class QuizApp extends StatelessWidget {
  final Quiz quiz;
  const QuizApp({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: quiz.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StartScreen(quiz: quiz),
    );
  }
}
