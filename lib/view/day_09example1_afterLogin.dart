import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/user.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({super.key, required this.id});
  final String id;

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // widget : 상위 클라스 프로퍼티를 갖다쓸수있다
        appBar: AppBar(title: Text('${widget.id} 환영합니다')),
        body: Center(
          child: Image.asset('images/clock.png', width: 40),
        ));
  }
}
