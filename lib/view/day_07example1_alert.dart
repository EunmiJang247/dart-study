import 'package:flutter/material.dart';

class AlertPract extends StatefulWidget {
  const AlertPract({super.key});

  @override
  State<AlertPract> createState() => _AlertPractState();
}

class _AlertPractState extends State<AlertPract> {
  late String _lampImage;
  late bool _isLampOn;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _isLampOn = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert를 이용한 메세지 출력'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 220,
                  height: 400,
                  child: Column(
                    children: [
                      Image.asset(
                        _lampImage,
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => turnOff(),
                      child: Text('끄기'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(60, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      onPressed: () => turnOn(),
                      child: Text('키기'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(60, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  turnOff() {
    if (_isLampOn) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('전구가 꺼집니다'),
              actions: [
                TextButton(
                  onPressed: () {
                    _lampImage = 'images/lamp_off.png';
                    _isLampOn = false;
                    Navigator.of(context).pop();

                    setState(() {});
                  },
                  child: const Text('확인'),
                ),
              ],
            );
          });
    } else if (_isLampOn == false) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('이미 꺼져 있습니다'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); //누르면 경고창 없어지니까 pop
                  },
                  child: const Text('확인'),
                ),
              ],
            );
          });
    }
  }

  turnOn() {
    if (_isLampOn) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('이미 켜져 있습니다'),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      _lampImage = 'images/lamp_on.png';
                      _isLampOn = true;
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: const Text('확인'),
                  ),
                ),
              ],
            );
          });
    } else {
      if (!_isLampOn) {
        _lampImage = 'images/lamp_on.png';
        _isLampOn = true;
        setState(() {});
      }
    }
  }
}
