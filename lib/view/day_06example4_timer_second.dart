import 'dart:async';

import 'package:flutter/material.dart';

class TimerPractSecond extends StatefulWidget {
  const TimerPractSecond({super.key});

  @override
  State<TimerPractSecond> createState() => _TimerPractSecondState();
}

class _TimerPractSecondState extends State<TimerPractSecond> {
  late List<String> charGroup;
  late int currentIndex;
  late String char;
  late String emptyChar;
  late List<String> charArr;
  late TextEditingController putTextInput;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    char = "대한민국만세";
    putTextInput = TextEditingController();
    emptyChar = char[currentIndex];

    Timer.periodic(Duration(seconds: 1), (timer) {
      // 3초에 한번씩 changeImage가 구동된다
      changeChar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LED광고",
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: putTextInput,
              decoration: const InputDecoration(
                labelText: '문구를 입력하세요',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(onPressed: () => changeCharText(), child: Text('변경')),
          SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  emptyChar,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  changeChar() {
    currentIndex += 1;
    if (currentIndex >= char.length) {
      currentIndex = 0;
      emptyChar = char[currentIndex];
    } else {
      emptyChar += char[currentIndex];
    }
    setState(() {});
  }

  changeCharText() {
    char = putTextInput.text;
    if (putTextInput.text.isEmpty) {
      char = "안녕하세요";
    }
    currentIndex = 0;
    emptyChar = char[currentIndex];
    setState(() {});
  }
}
