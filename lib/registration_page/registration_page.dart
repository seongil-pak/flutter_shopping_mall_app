import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TITLE'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // 더보기 버튼 로직
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 밑줄의 높이
          child: Container(
            color: Colors.purple[600], // 밑줄 색상
            height: 3.0, // 밑줄 두께
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 이미지 선택 버튼
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.grey[300],
            child: Center(
              child: TextButton(
                onPressed: () {
                  // 이미지 선택 로직
                },
                child: Text(
                  'image 선택',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // 상품 이름과 상품 가격
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상품 이름
              Row(
                children: [
                  Text('상품 이름',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // 상품 가격
              Row(
                children: [
                  Text('상품 가격',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.purple,
                          width: 3.0,
                        )),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('원',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          // 상품 설명
          Text('상품 설명',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          Spacer(),

          // 등록 버튼
          SizedBox(
            width: double.infinity, // 부모 위젯인 SizedBox가 너비를 무한대로 확장
            child: ElevatedButton(
              onPressed: () {
                // 등록하기 버튼 로직
              },
              child: Text(
                '등록하기',
                style:
                    TextStyle(fontSize: 16, color: Colors.white), // 텍스트 크기와 색상
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[600],
                // 버튼 배경색
                minimumSize: Size(double.infinity, 48), // 최소 크기
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // 버튼 높이 조정
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegistrationPage(),
  ));
}
