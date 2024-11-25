import 'package:flutter/material.dart';
import 'login_page.dart'; // 로그인 페이지 import
import 'signup_page.dart'; // 회원가입 페이지 importimport 'package:flutter/material.dart';
import 'auth_selection_page.dart'; // 경로 맞추기

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthSelectionPage(),
  ));
}


class AuthSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Zen',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Cursive',
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Log-in'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Sign-in'),
            ),
          ],
        ),
      ),
    );
  }
}
