import 'dart:typed_data';
import 'package:flutter/material.dart';

class ExplanationPage extends StatefulWidget {
  final Map<String, dynamic> product;

  ExplanationPage({required this.product});

  @override
  _ExplanationPageState createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  List<Map<String, dynamic>> savedProducts = []; // 상품 데이터를 저장할 리스트

  @override
  void initState() {
    super.initState();
    // 전달받은 데이터를 저장
    saveProduct(widget.product);
  }

  // 상품 저장 메서드
  void saveProduct(Map<String, dynamic> product) {
    setState(() {
      savedProducts.add(product); // 상품 데이터를 리스트에 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 정보'),
        shape: Border(bottom: BorderSide(color: Colors.deepPurple)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.black),
            child: widget.product['image'] != null
                ? (widget.product['image'] is Uint8List
                    ? Image.memory(
                        widget.product['image'],
                        width: 450,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        widget.product['image'],
                        width: 450,
                        height: 200,
                        fit: BoxFit.cover,
                      ))
                : SizedBox(
                    width: 450,
                    height: 200,
                    child: Center(
                      child: Text(
                        'No Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  widget.product['name'] ?? '상품 이름 없음',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  '${widget.product['price'] ?? 0}원',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '상품 설명',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  widget.product['description'] ?? '설명 없음',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Spacer(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text('1'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    '총 가격 ',
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 저장된 데이터 확인
                      print('저장된 상품: $savedProducts');
                    },
                    child: Text('구매하기'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
