import 'history_screen.dart';
import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import 'question_screen.dart';
import '../widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  final Quiz quiz;
  const StartScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Wellcome To The mock Quiz',
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset('assets/3.png'),
              const SizedBox(height: 40),
              const Spacer(),
              AppButton(
                label: 'Start Quiz',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuestionScreen(quiz: quiz),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              AppButton(
                label: '  History  ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HistoryScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
