import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/lamp.dart';
import 'package:second_flutter_pract/view/day_09example4_lampstaticSecond.dart';

class LampStaticFirst extends StatefulWidget {
  const LampStaticFirst({super.key});

  @override
  State<LampStaticFirst> createState() => _LampStaticFirstState();
}

class _LampStaticFirstState extends State<LampStaticFirst> {
  late String lampImage;

  @override
  void initState() {
    super.initState();
    lampImage = 'images/lamp_off.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('메인화면'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LampStaticSecond()))
                    .then((value) {
                  if (Lamp.switchValue) {
                    if (Lamp.colorValue) {
                      lampImage = 'images/lamp_red.png';
                    } else {
                      lampImage = 'images/lamp_on.png';
                    }
                    setState(() {});
                    //
                  } else {
                    lampImage = 'images/lamp_off.png';
                    setState(() {});
                  }
                });
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
        body: Center(
            child: Image.asset(
          lampImage,
          width: 200,
        )));
  }
}
