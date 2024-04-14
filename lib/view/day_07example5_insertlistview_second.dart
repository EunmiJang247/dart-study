import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add View')),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(labelText: '목록을 입력하세요'),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        ));
  }

  addList() {
    Message.imagePath = 'images/pencil.png';
    Message.workList = textEditingController.text;
    Message.action = true;
  }
}
