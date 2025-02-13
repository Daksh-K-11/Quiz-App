// import 'package:flutter/material.dart';
// import '../models/question.dart';
// import '../services/quiz_service.dart';
// import 'results_screen.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

  

//   @override
//   QuizScreenState createState() => QuizScreenState();
// }

// class QuizScreenState extends State<QuizScreen> {
//   final QuizService _quizService = QuizService();
//   List<Question> _questions = [];
//   int _currentQuestionIndex = 0;
//   int _score = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadQuestions();
//   }

//   Future<void> _loadQuestions() async {
//     try {
//       final questions = await _quizService.fetchQuestions();
//       setState(() {
//         _questions = questions;
//       });
//     } catch (e) {
//       print('Error loading questions: $e');
//     }
//   }

//   void _answerQuestion(String selectedAnswer) {
//     if (selectedAnswer == _questions[_currentQuestionIndex].correctAnswer) {
//       setState(() {
//         _score++;
//       });
//     }

//     if (_currentQuestionIndex < _questions.length - 1) {
//       setState(() {
//         _currentQuestionIndex++;
//       });
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultsScreen(score: _score, totalQuestions: _questions.length),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_questions.isEmpty) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     final currentQuestion = _questions[_currentQuestionIndex];
//     final answers = [...currentQuestion.incorrectAnswers, currentQuestion.correctAnswer]..shuffle();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Question ${_currentQuestionIndex + 1}/${_questions.length}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               currentQuestion.question,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             ...answers.map((answer) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: ElevatedButton(
//                 child: Text(answer),
//                 onPressed: () => _answerQuestion(answer),
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/quiz_service.dart';
import 'results_screen.dart';
import '../widgets/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  final QuizService _quizService = QuizService();
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await _quizService.fetchQuestions();
      setState(() {
        _questions = questions;
      });
    } catch (e) {
      print('Error loading questions: $e');
    }
  }

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex].correctAnswer) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(score: _score, totalQuestions: _questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Loading questions...',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: QuestionCard(
                question: currentQuestion,
                onAnswerSelected: _answerQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
