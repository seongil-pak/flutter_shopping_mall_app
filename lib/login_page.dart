import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall_app/homepage/home_page.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
        backgroundColor: Colors.deepPurple,
      ),
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
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // 아무 글자나 입력하면 홈 화면으로 이동
                  if (idController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    // 빈 입력 필드에 대한 처리
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('오류'),
                          content: Text('아이디와 비밀번호를 입력해주세요.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('로그인'
                ,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
