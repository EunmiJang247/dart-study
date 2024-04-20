import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/message.dart';

class TableListWheelListDetail extends StatefulWidget {
  const TableListWheelListDetail({super.key});

  @override
  State<TableListWheelListDetail> createState() =>
      _TableListWheelListDetailState();
}

class _TableListWheelListDetailState extends State<TableListWheelListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('자세히보기')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Message.imagePath,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(Message.workList),
              ),
            ],
          ),
        ));
  }
}
