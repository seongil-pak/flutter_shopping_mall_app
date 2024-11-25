import 'package:flutter/material.dart';
import 'login_page.dart'; // 로그인 페이지 import

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: '이름',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: genderController,
              decoration: InputDecoration(
                labelText: '성별 (여성/남성)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: '전화번호 +82',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // 모든 필드가 입력되었는지 확인
                  if (idController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      genderController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty) {
                    // 회원가입 완료 후 로그인 페이지로 이동
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  } else {
                    // 입력되지 않은 필드가 있을 경우 경고 메시지 표시
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('입력 오류'),
                          content: Text('모든 필드를 입력해주세요.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  '회원가입 완료',
                  style: TextStyle(
                    color: Colors.white, // 텍스트 색상 흰색으로 설정
                    fontWeight: FontWeight.bold, // 텍스트 두껍게
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // 버튼 배경색
                
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
