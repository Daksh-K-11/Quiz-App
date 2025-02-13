import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Category'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildCategoryCard(context, 'General Knowledge', '9'),
          _buildCategoryCard(context, 'Books', '10'),
          _buildCategoryCard(context, 'Film', '11'),
          _buildCategoryCard(context, 'Music', '12'),
          _buildCategoryCard(context, 'Television', '14'),
          _buildCategoryCard(context, 'Video Games', '15'),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String categoryId) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizScreen(),
            ),
          );
        },
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

