// 탭바는 홈페 있는거야.
import 'package:flutter/material.dart';
import 'package:second_flutter_pract/view/day_07example2_tabbar_firstpage.dart';
import 'package:second_flutter_pract/view/day_07example2_tabbar_secondpage.dart';

class Home1stPract extends StatefulWidget {
  const Home1stPract({super.key});

  @override
  State<Home1stPract> createState() => _Home1stPractState();
}

class _Home1stPractState extends State<Home1stPract>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin : 탭바를 만들기 위함.

  // 프로퍼티
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // length몇개만들꺼야 : 2개
    // vsync어디서 끼울꺼야? : this(여기.)
  }

  @override
  void dispose() {
    // 앱이 종료될 때: void dispose
    controller.dispose();
    // 탭바를 죽일꺼야 : controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Tab bar Test')),
      body: TabBarView(
        controller: controller,
        //콘트롤러는 위에서 만든 콘트롤뷰야.
        children: const [
          TabbarPract1FirstPage(),
          TabbarPract1SecondPage(),
        ],
        // 이제 화면 하단을 만들어주겠다
      ),
      bottomNavigationBar: Container(
        //TabBar를 콘테이너로 감싸서 크기, 색깔변경가능
        color: Colors.yellow,
        height: 100,
        child: TabBar(
          controller: controller,
          // 탭바 색깔변경
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 15,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one),
              text: "One",
            ),
            Tab(
              icon: Icon(Icons.looks_two),
              text: "Two",
            )
          ],
        ),
      ),
    );
  }
}
