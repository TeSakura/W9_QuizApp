import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../widgets/app_button.dart';
import '../widgets/choice_card.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  const QuestionScreen({super.key, required this.quiz});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int current = 0;
  late List<int?> answers;

  @override
  void initState() {
    super.initState();
    answers = List<int?>.filled(
      widget.quiz.questions.length,
      null,
      growable: false,
    );
  }

  void selectOption(int idx) {
    setState(() {
      answers[current] = idx;
    });
  }

  void next() {
    if (current < widget.quiz.questions.length - 1) {
      setState(() {
        current++;
      });
    } else {
      final score = widget.quiz.computeScore(answers);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ResultScreen(quiz: widget.quiz, answers: answers, score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.quiz.questions[current];
    final selected = answers[current];
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Question ${current + 1}/${widget.quiz.questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              q.text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(q.options.length, (i) {
              return ChoiceCard(
                text: q.options[i],
                selected: selected == i,
                onTap: () => selectOption(i),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: current == 0
                      ? null
                      : () {
                          setState(() {
                            current--;
                          });
                        },
                  child: const Text('Previous'),
                ),
                AppButton(
                  label: current == widget.quiz.questions.length - 1
                      ? 'Finish'
                      : 'Next',
                  onPressed: next,
                  enabled: answers[current] != null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
