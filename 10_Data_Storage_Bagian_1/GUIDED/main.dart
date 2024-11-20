import 'package:flutter/material.dart';
import 'package:md7/view/my_db_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade100),
        useMaterial3: true,
      ),
      home: const MyDatabaseView(), // Arahkan ke MyDatabaseView
    );
  }
}
