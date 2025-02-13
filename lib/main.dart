import 'package:flutter/material.dart';
import 'package:quiz_app/theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferences.getInstance(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Quiz App',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}