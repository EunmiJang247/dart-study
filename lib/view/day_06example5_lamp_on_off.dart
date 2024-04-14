import 'package:flutter/material.dart';

class LampOnOff extends StatefulWidget {
  const LampOnOff({super.key});

  @override
  State<LampOnOff> createState() => _LampOnOffState();
}

class _LampOnOffState extends State<LampOnOff> {
  late String _lampImage; //Image File name
  late double _lampWidth;
  late double _lampHeight;
  late String _buttonName;
  late bool _switch;

  late String _lampSizeStatus;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = '이미지 확대';
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Image확대 및 축소')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _lampImage,
                        width: _lampWidth,
                        height: _lampHeight,
                        fit: BoxFit.fill,
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        decisionLampSize();
                      },
                      child: Text(_buttonName)),
                  Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(fontSize: 10),
                      ),
                      Switch(
                          value: _switch,
                          onChanged: (value) {
                            _switch = value;
                            decisionOnFOff(value);
                          })
                    ],
                  )
                ],
              )
            ],
          )),
        ));
  }

  decisionOnFOff(value) {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
    setState(() {});
  }

  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampWidth = 1000;
      _buttonName = '이미지 축소';
      _lampSizeStatus = 'large';
    } else {
      _lampWidth = 150;
      _buttonName = '이미지 확대';
      _lampSizeStatus = 'small';
    }

    setState(() {});
  }
}
