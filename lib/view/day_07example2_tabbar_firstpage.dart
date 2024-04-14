import 'package:flutter/material.dart';

class TabbarPract1FirstPage extends StatefulWidget {
  const TabbarPract1FirstPage({super.key});

  @override
  State<TabbarPract1FirstPage> createState() => _TabbarPract1FirstPageState();
}

class _TabbarPract1FirstPageState extends State<TabbarPract1FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First page'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Text('첫번째 페이지'),
        ));
  }
}
