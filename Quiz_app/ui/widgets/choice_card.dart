import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  final bool showCorrect;
  final bool isCorrect;

  const ChoiceCard({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
    this.showCorrect = false,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    Color? bg;
    if (showCorrect) {
      if (isCorrect) {
        bg = Colors.green[100];
      } else if (selected && !isCorrect) {
        bg = Colors.red[100];
      }
    } else if (selected) {
      bg = Colors.blue[50];
    }

    return Card(
      color: bg,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
