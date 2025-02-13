import 'package:flutter/material.dart';
import '../utils/score_utils.dart';
import 'login_screen.dart';

class ResultsScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  ResultsScreenState createState() => ResultsScreenState();
}

class ResultsScreenState extends State<ResultsScreen> {
  int highScore = 0;

  @override
  void initState() {
    super.initState();
    _loadHighScore();
  }

  Future<void> _loadHighScore() async {
    int hs = await getHighScore();
    setState(() {
      highScore = hs;
    });
  }

  Future<void> _saveScore() async {
    await saveScore(widget.score);
    _loadHighScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(
                255,
                78,
                13,
                151,
              ),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your Score: ${widget.score} / ${widget.totalQuestions}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'High Score: $highScore',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      _saveScore();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Score saved!')),
                      );
                    },
                    // style: TextButton.styleFrom(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 14, horizontal: 28),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   textStyle: const TextStyle(fontSize: 18),
                    // ),
                    child: const Text('Save Score'),
                  ),
                  const SizedBox(height: 15),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const LoginScreen()));
                    },
                    label: const Text('Logout'),
                    icon: const Icon(Icons.logout),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
