import 'package:flutter/material.dart';

class TabbarPract1SecondPage extends StatefulWidget {
  const TabbarPract1SecondPage({super.key});

  @override
  State<TabbarPract1SecondPage> createState() => _TabbarPract1SecondPageState();
}

class _TabbarPract1SecondPageState extends State<TabbarPract1SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second page'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Text('두번째 페이지'),
        ));
  }
}
