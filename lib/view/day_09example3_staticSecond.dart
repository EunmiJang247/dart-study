import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/lamp.dart';

class StaticSecond extends StatefulWidget {
  const StaticSecond({super.key});

  @override
  State<StaticSecond> createState() => _StaticSecondState();
}

class _StaticSecondState extends State<StaticSecond> {
  late TextEditingController textEditingController;
  late String switchLabel;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = Lamp.contents;

    if (Lamp.lampStatus) {
      switchLabel = "ON";
      switchValue = true;
    } else {
      switchLabel = "OFF";
      switchValue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('수정화면')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(switchLabel),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Switch(
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
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Lamp.contents = textEditingController.text;
                      Lamp.lampStatus = switchValue;
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            ),
          ),
        ));
  }
}
