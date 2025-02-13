import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveScore(int score) async {
  final prefs = await SharedPreferences.getInstance();
  final highScore = prefs.getInt('highScore') ?? 0;
  if (score > highScore) {
    await prefs.setInt('highScore', score);
  }
}

Future<int> getHighScore() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('highScore') ?? 0;
}

