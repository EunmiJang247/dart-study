import 'package:flutter/material.dart';

class ImageSwipePrevNextPract extends StatefulWidget {
  const ImageSwipePrevNextPract({super.key});

  @override
  State<ImageSwipePrevNextPract> createState() =>
      _ImageSwipePrevNextPractState();
}

class _ImageSwipePrevNextPractState extends State<ImageSwipePrevNextPract> {
  late List imageName;
  late int currentImagIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        appBar: AppBar(
          title: const Text(
            "무한 이미지 반복",
          ),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  imageName[currentImagIndex],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'images/${imageName[currentImagIndex]}',
                width: 350,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => _leftBtnPressed(),
                      child: Text('Left'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                          //모양바꾸기
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => _rightBtnPressed(),
                      child: Text('Right'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                          //모양바꾸기
                          ),
                    ),
                  )
                ],
              )
            ],
          )),
        ));
  }

  _leftBtnPressed() {
    currentImagIndex--;
    print(currentImagIndex);
    if (currentImagIndex < 0) {
      currentImagIndex = imageName.length - 1;
    }
    setState(() {});
  }

  _rightBtnPressed() {
    currentImagIndex++;
    if (currentImagIndex >= imageName.length) {
      currentImagIndex = 0;
    }
    setState(() {});
  }
}
