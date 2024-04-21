import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/collection_message.dart';

class InsertViewFirst extends StatefulWidget {
  const InsertViewFirst({super.key});

  @override
  State<InsertViewFirst> createState() => _InsertViewFirstState();
}

class _InsertViewFirstState extends State<InsertViewFirst> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    CollectionMessage.humanName = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('인물 추가')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: '인물을 추가하세요'),
              ),
              ElevatedButton(onPressed: () => addList(), child: Text('추가'))
            ],
          ),
        ),
      ),
    );
  }

  addList() {
    if (nameController.text.trim().isNotEmpty) {
      CollectionMessage.humanName = nameController.text.trim();
    }
    Navigator.pop(context);
  }
}
