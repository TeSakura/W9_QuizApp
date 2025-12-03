import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../widgets/app_button.dart';
import '../widgets/choice_card.dart';
import '../../data/repositories/history_service.dart';

class ResultScreen extends StatefulWidget {
  final Quiz quiz;
  final List<int?> answers;
  final int score;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.answers,
    required this.score,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      HistoryService.saveScore(
        widget.quiz.title,
        widget.score,
        widget.quiz.questions.length,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your score: ${widget.score} / ${widget.quiz.questions.length}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: widget.quiz.questions.length,
                itemBuilder: (context, idx) {
                  final q = widget.quiz.questions[idx];
                  final ans = widget.answers[idx];
                  final correct = q.correctIndex;

                  return ListTile(
                    title: Text(q.text),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        ChoiceCard(
                          text:
                              'Your answer: ${ans != null ? q.options[ans] : "No answer"}',
                          selected: ans != null,
                          onTap: () {},
                          showCorrect: true,
                          isCorrect: ans == correct,
                        ),
                        const SizedBox(height: 6),
                        Text('Correct answer: ${q.options[correct]}'),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),

            AppButton(
              label: 'Back to Start',
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
