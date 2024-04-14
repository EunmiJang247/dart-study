import 'package:flutter/material.dart';
import 'package:second_flutter_pract/view/day_07example3_tabbar_firstpage.dart';
import 'package:second_flutter_pract/view/day_07example3_tabbar_secondpage.dart';

class Home2ndPract extends StatefulWidget {
  const Home2ndPract({super.key});

  @override
  State<Home2ndPract> createState() => _Home2ndPractState();
}

class _Home2ndPractState extends State<Home2ndPract> // {로 열면 안됨
    with
        SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          TabbarPract2FirstPage(),
          TabbarPract2SecondPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.blue,
        indicatorColor: Colors.red,
        indicatorWeight: 15,
        tabs: const [
          Tab(
            icon: Icon(Icons.looks_one),
            text: "One",
          ),
          Tab(
            icon: Icon(Icons.looks_one),
            text: "Two",
          ),
        ],
      ),
    );
  }
}
