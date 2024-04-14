import 'dart:async';
import 'package:flutter/material.dart';

class LampOnOffSecond extends StatefulWidget {
  const LampOnOffSecond({super.key});

  @override
  State<LampOnOffSecond> createState() => _LampOnOffSecondState();
}

class _LampOnOffSecondState extends State<LampOnOffSecond> {
  late String _lampImage; //Image File name
  late double _lampWidth;
  late double _lampHeight;
  late String _buttonName;
  late bool _switch;
  late String _lampSizeStatus;
  late double _rotateAngle;
  late bool _switchColorToRed;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = '이미지 확대';
    _switch = true;
    _lampSizeStatus = 'small';
    _rotateAngle = 0;
    _switchColorToRed = false;

    // Timer.periodic(Duration(milliseconds: 50), (timer) {
    //   ratateEverySeconds();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소2'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250,
                height: 400,
                child: Column(
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(_rotateAngle * 2 / 360),
                      child: Image.asset(
                        _lampImage,
                        width: _lampWidth,
                        height: _lampHeight,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          _buttonName,
                          style: TextStyle(fontSize: 10),
                        ),
                        Switch(
                            value: _lampSizeStatus != 'small',
                            onChanged: (value) {
                              decisionLampSize(value);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          '전구스위치 ${_switch ? "OFF" : "ON"}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Switch(
                            value: _switch,
                            onChanged: (value) {
                              _switch = value;
                              decisionOnFOff(value);
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          '색깔 ${_switchColorToRed ? "OFF" : "ON"}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Switch(
                            value: _switchColorToRed,
                            onChanged: (value) {
                              _switchColorToRed = value;
                              decisionColor(value);
                            })
                      ],
                    ),
                  ),
                  // Slider(
                  //     min: 0,
                  //     max: 360,
                  //     value: _rotateAngle,
                  //     onChanged: (value) {
                  //       _rotateAngle = value;
                  //       setState(() {});
                  //     })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  decisionLampSize(value) {
    if (_lampSizeStatus == 'small') {
      _lampWidth = 300;
      _lampHeight = 400;
      _buttonName = '이미지 축소';
      _lampSizeStatus = 'large';
    } else {
      _lampWidth = 150;
      _buttonName = '이미지 확대';
      _lampSizeStatus = 'small';
    }
    setState(() {});
  }

  decisionOnFOff(value) {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
    setState(() {});
  }

  ratateEverySeconds() {
    _rotateAngle++;
    setState(() {});
  }

  decisionColor(value) {
    if (_switch) {
      if (value) {
        _lampImage = 'images/lamp_red.png';
      } else {
        _lampImage = 'images/lamp_on.png';
      }
    }
    setState(() {});
  }
}
