import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall_app/explanation_page/explanation_page.dart';
import 'package:intl/intl.dart'; // 숫자 포맷용
import 'explanation_page.dart'; // 상세 페이지 import

class ListPage extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const ListPage({Key? key, required this.products}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Map<String, dynamic>> _savedProducts = [];

  @override
  void initState() {
    super.initState();
    // 초기 데이터 저장
    _savedProducts.addAll(widget.products);

    // 디버깅 로그
    print('Received products: ${widget.products}');
    print('Saved products in state: $_savedProducts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 목록'),
        centerTitle: true,
      ),
      body: _savedProducts.isEmpty
          ? Center(
              child: Text(
                '등록된 상품이 없습니다.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: _savedProducts.length,
              itemBuilder: (context, index) {
                final product = _savedProducts[index];

                // 이미지 처리
                Widget imageWidget;
                if (product['image'] is Uint8List) {
                  imageWidget = Image.memory(
                    product['image'], // Uint8List를 처리
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  );
                } else if (product['image'] is File) {
                  imageWidget = Image.file(
                    product['image'], // File을 처리
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  );
                } else {
                  imageWidget = Icon(
                    Icons.shopping_bag,
                    size: 50,
                    color: Colors.grey,
                  ); // 기본 아이콘
                }

                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // 이미지 모서리 둥글게
                      child: imageWidget,
                    ),
                    title: Text(
                      product['name'] ?? '상품 이름 없음',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${NumberFormat("#,###").format(product['price'])} 원',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onTap: () {
                      // 상품을 눌렀을 때 상세 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ExplanationPage(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
