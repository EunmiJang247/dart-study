import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/message.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('자세히보기')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Message.workList),
              Image.asset(
                Message.imagePath,
              )
            ],
          ),
        ));
  }
}
