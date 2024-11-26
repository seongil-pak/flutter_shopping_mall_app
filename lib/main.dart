import 'package:flutter/material.dart';
import 'auth_selection_page.dart'; // AuthSelectionPage import

// 전역 변수 선언 (globalProducts)
List<Map<String, dynamic>> globalProducts = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      title: 'Zent App',
      home: AuthSelectionPage(), // 앱의 첫 화면 설정

      
      // HomePage 위젯 연결
    );
  }
}
