import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/lamp.dart';
import 'package:second_flutter_pract/view/day_09example3_staticSecond.dart';

class StaticFirst extends StatefulWidget {
  const StaticFirst({super.key});

  @override
  State<StaticFirst> createState() => _StaticFirstState();
}

class _StaticFirstState extends State<StaticFirst> {
  // Property
  late TextEditingController textEditingController;
  late String lampImage;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    lampImage = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('main화면'),
          actions: [
            IconButton(
                onPressed: () {
                  Lamp.contents = textEditingController.text;
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StaticSecond()))
                      .then((value) => getData());
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                ),
              ),
              Image.asset(
                lampImage,
                width: 150,
              ),
            ],
          ),
        ));
  }

  getData() {
    textEditingController.text = Lamp.contents;
    if (Lamp.lampStatus) {
      lampImage = 'images/lamp_on.png';
    } else {
      lampImage = 'images/lamp_off.png';
    }
    setState(() {});
  }
}
