import 'package:flutter/material.dart';
import 'package:second_flutter_pract/tab/home3.dart';
import 'package:second_flutter_pract/view/day_06example1.dart';
import 'package:second_flutter_pract/view/day_06example2.dart';
import 'package:second_flutter_pract/view/day_06example3_timer.dart';
import 'package:second_flutter_pract/view/day_06example4_timer_second.dart';
import 'package:second_flutter_pract/view/day_06example5_lamp_on_off.dart';
import 'package:second_flutter_pract/view/day_06example6_lamp_on_off_second.dart';
import 'package:second_flutter_pract/view/day_07example1_alert.dart';
import 'package:second_flutter_pract/tab/home.dart';
import 'package:second_flutter_pract/tab/home2.dart';
import 'package:second_flutter_pract/view/day_07example3_tabbar_firstpage.dart';
import 'package:second_flutter_pract/view/day_07example4_listview_first.dart';
import 'package:second_flutter_pract/view/day_07example5_insertlistview_second.dart';
import 'package:second_flutter_pract/view/day_07example5_listview_first.dart';
import 'package:second_flutter_pract/view/day_08example1_pract_first.dart';
// import 'package:second_flutter_pract/view/day_07example2_tabbar_firstpage.dart'; //안쓸꺼니까 지워
// import 'package:second_flutter_pract/view/day_07example2_tabbar_secondpage.dart'; //안쓸꺼니까 지워

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const TimerPract(),
  //   );
  // }

  // 두번째 예제
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const TimerPractSecond(),
  //   );
  // }

  //세번째 예제
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const LampOnOff(),
  //   );
  // }

  // 네번재 예제
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const LampOnOffSecond(),
  //   );
  // }

  //alert 예제
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const AlertPract(),
  //   );
  // }

  //tabBar예제
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const Home1stPract(),
  //   );
  // }

  //tabBar예제2
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const Home2ndPract(),
  //   );
  // }

  // 리스트뷰 첫번째
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const ListViewFirst(),
  //   );
  // }

  // 리스트뷰 두번째 예제
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     // 라우트 잡을 것이다
  //     routes: {
  //       '/': (context) => const TableList(),
  //       '/insert': (context) => const InsertList(),
  //     },
  //     initialRoute: '/',
  //   );
  // }

  // 동물카드 실습
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 라우트 잡을 것이다
      routes: {
        '/': (context) => const AnimalCardsList(),
      },
      initialRoute: '/',
    );
  }
}
