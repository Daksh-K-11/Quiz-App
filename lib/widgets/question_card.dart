// import 'package:flutter/material.dart';
// import '../models/quiz_response.dart';

// class QuestionCard extends StatelessWidget {
//   final Question question;
//   final Function(String) onAnswerSelected;

//   const QuestionCard({
//     super.key,
//     required this.question,
//     required this.onAnswerSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final allAnswers = [...question.incorrectAnswers, question.correctAnswer];
//     allAnswers.shuffle();

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       margin: const EdgeInsets.all(16),
//       elevation: 8,
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               question.question,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 24),
//             ...allAnswers.map(
//               (answer) => Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: AnswerButton(
//                   answer: answer,
//                   onPressed: () => onAnswerSelected(answer),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnswerButton extends StatelessWidget {
//   final String answer;
//   final VoidCallback onPressed;

//   const AnswerButton({
//     super.key,
//     required this.answer,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         minimumSize: const Size(double.infinity, 48),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         textStyle: const TextStyle(fontSize: 18),
//       ),
//       child: Text(answer),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../models/question.dart';

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

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(16),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...allAnswers.map(
              (answer) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AnswerButton(
                  answer: answer,
                  onPressed: () => onAnswerSelected(answer),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answer;
  final VoidCallback onPressed;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
