import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percobaan/view/detail_page.dart';
import 'package:percobaan/view/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(title: 'Belajar GetX')),
        GetPage(name: '/detail', page: () => DetailPage()),
      ],
    );
  }
}
