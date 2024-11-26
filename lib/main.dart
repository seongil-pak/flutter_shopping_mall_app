import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall_app/homepage/home_page.dart';

// 전역 변수 선언 (globalProducts)
List<Map<String, dynamic>> globalProducts = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버깅 배너 제거
      theme: ThemeData(
        primarySwatch: Colors.purple, // 앱 테마 색상
      ),
      home: HomePage(), // HomePage 위젯 연결
    );
  }
}
