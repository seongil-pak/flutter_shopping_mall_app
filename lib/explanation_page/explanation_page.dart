import 'package:flutter/material.dart';

class ExplanationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 정보'),
        shape: Border(bottom: BorderSide(color: Colors.deepPurple)),
      ),
    );
  }
}
