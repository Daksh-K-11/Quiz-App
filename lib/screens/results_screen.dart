import 'package:flutter/material.dart';
import 'package:quiz_app/screens/category_selection_screen.dart';
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Score saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Quiz Results'),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade100],
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
                  // Save Score Button
                  TextButton(
                    onPressed: _saveScore,
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
                  const SizedBox(height: 16), 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategorySelectionScreen(name: '')),
                        (route) => false,
                      );
                    },
                    // style: ElevatedButton.styleFrom(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 14, horizontal: 28),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   textStyle: const TextStyle(fontSize: 18),
                    // ),
                    child: const Text('Play Again'),
                  ),
                  const SizedBox(height: 20),
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
