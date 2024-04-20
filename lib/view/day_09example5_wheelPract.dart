import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WheelPract extends StatefulWidget {
  const WheelPract({super.key});

  @override
  State<WheelPract> createState() => _WheelPractState();
}

class _WheelPractState extends State<WheelPract> {
  late List<String> _imageName; // imageList
  late int _selectedItem; // 이미지 순번

  @override
  void initState() {
    super.initState();
    _imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg',
    ];
    _selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Picker View')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 300,
                height: 250,
                child: CupertinoPicker(
                  // backgroundColor: Colors.amber,
                  itemExtent: 50, // 이미지의 width와 맞춰야해
                  scrollController: FixedExtentScrollController(
                      initialItem: 0), //_selectedItem와 같아야해.
                  onSelectedItemChanged: (value) {
                    //선택되면 어떻게 할꺼니?
                    _selectedItem = value;
                    setState(() {});
                  },
                  children: List.generate(
                      10,
                      (index) => Center(
                            child: Image.asset(
                              'images/${_imageName[index]}',
                              width: 50,
                            ),
                          )), //리스트를 직접 만들꺼야
                  // children: [
                  //   // Text(_imageName[0]),
                  //   // Text(_imageName[1]),
                  //   // Text(_imageName[2]),
                  //   // Text(_imageName[3]),
                  //   // Text(_imageName[4]),
                  //   // Text(_imageName[5]),
                  //   // Text(_imageName[6]),
                  //   // Text(_imageName[7]),
                  //   // Text(_imageName[8]),
                  //   // Text(_imageName[9]),
                  //   Image.asset(
                  //     'images/${_imageName[0]}',
                  //     width: 50,
                  //   ),
                  //   Image.asset(
                  //     'images/${_imageName[1]}',
                  //     width: 50,
                  //   ),
                  //   Image.asset(
                  //     'images/${_imageName[2]}',
                  //     width: 50,
                  //   ),
                  //   Image.asset(
                  //     'images/${_imageName[3]}',
                  //     width: 50,
                  //   ),
                  //   Image.asset(
                  //     'images/${_imageName[4]}',
                  //     width: 50,
                  //   ),
                  //   Image.asset(
                  //     'images/${_imageName[5]}',
                  //     width: 50,
                  //   ),
                  //   Image.asset(
                  //     'images/${_imageName[6]}',
                  //     width: 50,
                  //   ),
                  // ]),
                )),
            Text('Selected Item : ${_imageName[_selectedItem]}'),
            Image.asset(
              'images/${_imageName[_selectedItem]}',
              width: 300,
              height: 200,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
