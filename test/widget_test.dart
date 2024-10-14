import 'package:cine_stream/new_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:daily_times/main.dart'; 

void main() {
  testWidgets('News app loads and shows title', (WidgetTester tester) async {
    // Create a dummy toggleTheme function
    void dummyToggleTheme() {
      // Implement the toggle theme logic here if needed for testing
    }

    // Build the app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: NewsListScreen(
          toggleTheme: dummyToggleTheme, // Provide the required toggleTheme argument
          isDarkTheme: false,             // Provide the required isDarkTheme argument
        ),
      ),
    );

    // Verify if the app shows the expected title "Daily Times".
    expect(find.text('Daily Times'), findsOneWidget);

    // Verify if the ListView contains the news articles.
    expect(find.byType(ListView), findsOneWidget);

    // Optionally, check if a specific news article is loaded.
    expect(find.text('Supreme Court Ruling on Article 370'), findsOneWidget);
  });
}