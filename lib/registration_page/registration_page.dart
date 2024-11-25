import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  File? _selectedImage; // 선택된 이미지 파일 저장
  final TextEditingController _priceController =
      TextEditingController(); // 상품 가격 컨트롤러
  final TextEditingController _nameController =
      TextEditingController(); // 상품 이름 컨트롤러
  final TextEditingController _descriptionController =
      TextEditingController(); // 상품 설명 컨트롤러

  final List<Map<String, dynamic>> _products = []; // 저장된 상품 목록

  @override
  void dispose() {
    _priceController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // 이미지 선택 함수
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      // 갤러리에서 이미지 선택
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path); // 선택된 이미지 저장
        });
      }
    } catch (e) {
      // 에러 처리
      print("이미지 선택 중 에러 발생: $e");
    }
  }

  // 등록하기 버튼 로직
  void _saveProduct() {
    // 모든 필드가 입력되었는지 확인
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 필드를 입력해주세요!')),
      );
      return;
    }

    // 데이터를 Map으로 저장
    final Map<String, dynamic> productData = {
      'name': _nameController.text,
      'price': _priceController.text, // 쉼표 제거 로직 없음
      'description': _descriptionController.text,
      'image': _selectedImage,
    };

    setState(() {
      _products.add(productData); // 상품 데이터를 리스트에 추가
    });

    // 확인용 콘솔 출력
    print('저장된 상품 목록:');
    _products.forEach((product) {
      print(product);
    });

    // 입력 필드 초기화
    _nameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedImage = null; // 이미지 초기화
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('상품이 등록되었습니다!')),
    );
  }

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
          // 이미지 선택 버튼 및 미리보기
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: _selectedImage == null
                  ? Center(
                      child: Text(
                        'image 선택',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
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
                      controller: _nameController,
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
                      controller: _priceController,
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
            controller: _descriptionController,
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
              onPressed: _saveProduct, // Map으로 저장하는 로직 호출
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
