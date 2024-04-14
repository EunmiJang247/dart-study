import 'dart:async';

import 'package:flutter/material.dart';

class TimerPract extends StatefulWidget {
  const TimerPract({super.key});

  @override
  State<TimerPract> createState() => _TimerPractState();
}

class _TimerPractState extends State<TimerPract> {
  late List<String> imagesFile;
  late int currentPage;

  @override
  void initState() {
    super.initState();
    imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentPage = 0;

    // 빌드 되기 전에 타이머를 설치해야해.
    Timer.periodic(Duration(seconds: 3), (timer) {
      // 3초에 한번씩 changeImage가 구동된다
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('3초마다 무한반복')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imagesFile[currentPage],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'images/${imagesFile[currentPage]}',
                width: 350,
              )
            ],
          ),
        ));
  }

  //functions
  changeImage() {
    currentPage++;
    if (currentPage >= imagesFile.length) {
      currentPage = 0;
    }
    setState(() {});
  }
} // End
