import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 목록'),
        shape: Border(bottom: BorderSide(color: Colors.deepPurple)),
      ),
    );
  }
}
