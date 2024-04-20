import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/user.dart';
import 'package:second_flutter_pract/view/day_09example1_afterLogin.dart';

class LoginFirst extends StatefulWidget {
  const LoginFirst({super.key});

  @override
  State<LoginFirst> createState() => _LoginFirstState();
}

class _LoginFirstState extends State<LoginFirst> {
  // 화면에 쓰는 변수들 선언
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    //생성자 이름을 통해 만들어줌
    passwordController = TextEditingController();
    // 데이터 아무것도 없는 상태
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('로그인')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/login.png'),
                    radius: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: userIdController,
                    decoration:
                        const InputDecoration(labelText: "사용자 아이디를 입력하세요"),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: passwordController,
                    decoration:
                        const InputDecoration(labelText: "사용자 비밀번호를 입력하세요"),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => inputCheck(context),
                    child: const Text('login')),
              ],
            ),
          ),
        ));
  }

  inputCheck(context) {
    if (userIdController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      //snackbar
      errorSnackBar(context, '아이디와 패스워드를 입력하세요', Colors.red);
    } else {
      if (userIdController.text.trim() == 'root' &&
          passwordController.text.trim() == 'qwer1234') {
        //통과
        _showDialog();
      } else {
        //오류
        errorSnackBar(context, '틀립니다', Colors.blue);
      }
    }
  }

  errorSnackBar(context, str, backColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(str),
      duration: const Duration(seconds: 2),
      backgroundColor: backColor,
    ));
  }

  _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('확영합니다'),
            content: const Text('신분이 확인 되었습니다'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    userIdController.text = '';
                    passwordController.text = '';
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      String id = userIdController.text.trim();
                      return AfterLogin(id: id);
                    })));
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
