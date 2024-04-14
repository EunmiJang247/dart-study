import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ImageSwipePract extends StatefulWidget {
  const ImageSwipePract({super.key});

  @override
  State<ImageSwipePract> createState() => _ImageSwipePractState();
}

class _ImageSwipePractState extends State<ImageSwipePract> {
  late List imageName;
  late int currentImagIndex;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImagIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이미지 스와이핑")),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) =>
            _onHorizontalSwipe(direction), //좌우 스와이핑
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        onDoubleTap: () => _onDoubleTap(),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName[currentImagIndex]),
            Image.asset(
              'images/${imageName[currentImagIndex]}',
              width: 350,
            ),
          ],
        )),
      ),
    );
  }

  // Functions
  _onHorizontalSwipe(direction) {
    if (direction == SwipeDirection.left) {
      currentImagIndex++;
      if (currentImagIndex >= imageName.length) {
        currentImagIndex = 0;
      }
    } else if (direction == SwipeDirection.right) {
      currentImagIndex--;
      if (currentImagIndex < 0) {
        currentImagIndex = imageName.length - 1;
      }
    }
    setState(() {});
  }

  _onVerticalSwipe(direction) {
    if (direction == SwipeDirection.up) {
      currentImagIndex++;
      if (currentImagIndex >= imageName.length) {
        currentImagIndex = 0;
      }
    } else if (direction == SwipeDirection.down) {
      currentImagIndex--;
      if (currentImagIndex < 0) {
        currentImagIndex = imageName.length - 1;
      }
    }
    setState(() {});
  }

  _onDoubleTap() {
    currentImagIndex++;
    if (currentImagIndex >= imageName.length) {
      currentImagIndex = 0;
    }
    setState(() {});
  }
}
