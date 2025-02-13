import 'package:flutter/material.dart';
import '../models/question.dart';
import 'answer_button.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final allAnswers = [...question.incorrectAnswers, question.correctAnswer];
    allAnswers.shuffle();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Styled question text
            Text(
              question.question,
              style: const TextStyle(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...allAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: AnswerButton(
                  answer: answer,
                  onPressed: () => onAnswerSelected(answer),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

