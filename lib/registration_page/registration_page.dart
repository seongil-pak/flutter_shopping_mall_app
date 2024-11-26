import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 전역 변수 선언
List<Map<String, dynamic>> globalProducts = [];

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Uint8List? _selectedImageData;
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // 이미지 다운로드 함수
  Future<void> _pickImage() async {
    final String imageUrl =
        'https://picsum.photos/200/300?random=${DateTime.now().millisecondsSinceEpoch}';
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        setState(() {
          _selectedImageData = response.bodyBytes;
        });
      } else {
        print("이미지 다운로드 실패: ${response.statusCode}");
      }
    } catch (e) {
      print("이미지 다운로드 에러: $e");
    }
  }

  // 등록 완료 팝업 표시
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('등록 완료'),
          content: Text('상품이 성공적으로 등록되었습니다!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // 팝업 닫기
                Navigator.pop(context); // HomePage로 이동
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 상품 저장 및 처리
  void _saveProduct() {
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 필드를 입력해주세요!')),
      );
      return;
    }

    // 상품 데이터 생성
    final Map<String, dynamic> newProduct = {
      'name': _nameController.text,
      'price': int.tryParse(_priceController.text.replaceAll(',', '')) ?? 0,
      'description': _descriptionController.text,
      'image': _selectedImageData ?? Uint8List(0), // 기본값 설정
    };

    // 전역 리스트에 저장
    globalProducts.add(newProduct);
    print('Global products: $globalProducts'); // 디버깅용 출력

    // 등록 완료 팝업 표시
    _showSuccessDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 등록'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: Container(
            color: Colors.purple[600],
            height: 3.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 선택 버튼
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: _selectedImageData == null
                    ? Center(
                        child: Text(
                          '이미지 선택',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : Image.memory(
                        _selectedImageData!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(height: 20),

            // 상품 이름 입력
            Row(
              children: [
                Text(
                  '상품 이름',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // 상품 가격 입력
            Row(
              children: [
                Text(
                  '상품 가격',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
            SizedBox(height: 10),

            // 상품 설명 입력
            Text(
              '상품 설명',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10),

            // 등록 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveProduct,
                child: Text(
                  '등록하기',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[600],
                  minimumSize: Size(double.infinity, 48),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
