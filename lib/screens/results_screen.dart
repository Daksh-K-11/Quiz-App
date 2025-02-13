import 'package:flutter/material.dart';
import '../utils/score_utils.dart';
import 'login_screen.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score / $totalQuestions',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Save Score'),
              onPressed: () async {
                await saveScore(score);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Score saved!')),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('View High Score'),
              onPressed: () async {
                final highScore = await getHighScore();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('High Score'),
                    content: Text('Your high score is: $highScore'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Play Again'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

