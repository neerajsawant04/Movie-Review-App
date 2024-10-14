import 'package:flutter/material.dart';

class NewsListScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme;

  const NewsListScreen({super.key, required this.toggleTheme, required this.isDarkTheme}); // Converted to super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: const Center(
        child:  Text('News List will be displayed here.'),
      ),
    );
  }
}