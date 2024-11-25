import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall_app/explanation_page/%08product.dart';
import 'product.dart';

class ExplanationPage extends StatelessWidget {
  final Product product;

  ExplanationPage({required this.product});

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
            child: product.image != null
                ? Image.file(
                    product.image!,
                    width: 450,
                    height: 200,
                    fit: BoxFit.cover,
                  )
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
                  product.name,
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  '${product.price}원',
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
                  product.description,
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
                    onPressed: () {},
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
