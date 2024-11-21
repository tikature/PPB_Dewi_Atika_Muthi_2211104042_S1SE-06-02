import 'package:flutter/material.dart';
import 'view/biodata_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade300),
        useMaterial3: true,
      ),
      home: const BiodataMahasiswaView(),
    );
  }
}
