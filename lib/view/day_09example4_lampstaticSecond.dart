import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/lamp.dart';

class LampStaticSecond extends StatefulWidget {
  const LampStaticSecond({super.key});

  @override
  State<LampStaticSecond> createState() => _LampStaticSecondState();
}

class _LampStaticSecondState extends State<LampStaticSecond> {
  late String colorLabel;
  late String switchLabel;
  late bool colorValue;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    colorLabel = "Red";
    switchLabel = "Off";
    colorValue = false;
    switchValue = false;

    if (Lamp.colorValue) {
      colorValue = true;
      colorLabel = "RED";
    } else {
      colorValue = false;
      colorLabel = "YELLOW";
    }

    if (Lamp.switchValue) {
      switchValue = true;
      switchLabel = "ON";
    } else {
      switchValue = false;
      switchLabel = "OFF";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('수정화면'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(colorLabel),
                  Switch(
                      value: colorValue,
                      onChanged: (value) {
                        colorValue = value;
                        if (value) {
                          colorLabel = "RED";
                        } else {
                          colorLabel = "YELLOW";
                        }
                        setState(() {});
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(switchLabel),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = value;
                        if (value) {
                          switchLabel = "ON";
                        } else {
                          switchLabel = "OFF";
                        }
                        setState(() {});
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                    onPressed: () => onOkBtnCliked(), child: const Text('OK')),
              )
            ],
          ),
        ));
  }

  onOkBtnCliked() {
    Lamp.switchValue = switchValue;
    Lamp.colorValue = colorValue;
    Lamp.switchLabel = switchLabel;
    Lamp.colorLabel = colorLabel;
    Navigator.pop(context);
    setState(() {});
  }
}
