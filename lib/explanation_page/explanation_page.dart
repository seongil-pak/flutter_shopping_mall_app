import 'dart:typed_data';
import 'package:flutter/material.dart';

class ExplanationPage extends StatefulWidget {
  final Map<String, dynamic> product;

  ExplanationPage({required this.product});

  @override
  _ExplanationPageState createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  List<Map<String, dynamic>> savedProducts = [];
  int quantity = 1;

  @override
  void initState() {
    super.initState();

    saveProduct(widget.product);
  }

  void saveProduct(Map<String, dynamic> product) {
    setState(() {
      savedProducts.add(product);
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('구매 확인'),
          content: Text('${widget.product['name']}을(를) ${quantity}개 구매하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('구매하기'),
              onPressed: () {
                print('구매 완료: ${widget.product['name']} ${quantity}개');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                    ? AspectRatio(
                        aspectRatio: 2.25 / 1,
                        child: Image.memory(
                          widget.product['image'],
                          fit: BoxFit.cover,
                        ),
                      )
                    : AspectRatio(
                        aspectRatio: 2.25 / 1,
                        child: Image.file(
                          widget.product['image'],
                          fit: BoxFit.cover,
                        ),
                      ))
                : SizedBox(
                    width: double.infinity,
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
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    '총 가격 ',
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog();
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
