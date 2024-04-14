import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool _purchaseSwitch;
  late bool _appointmentSwitch;
  late bool _studySwitch;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
    _purchaseSwitch = false;
    _appointmentSwitch = false;
    _studySwitch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add View')),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('구매'),
              Switch(
                  value: _purchaseSwitch,
                  onChanged: (value) {
                    _purchaseSwitch = value;
                    onPurchanseBtnClick(value);
                    setState(() {});
                  }),
              Image.asset('images/cart.png')
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('약속'),
              Switch(
                  value: _appointmentSwitch,
                  onChanged: (value) {
                    _appointmentSwitch = value;
                    onAppointmentBtnClick(value);
                    setState(() {});
                  }),
              Image.asset('images/clock.png')
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('공부'),
              Switch(
                  value: _studySwitch,
                  onChanged: (value) {
                    _studySwitch = value;
                    onStudyBtnClick(value);
                    setState(() {});
                  }),
              Image.asset('images/pencil.png')
            ]),
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
    Message.imagePath = _studySwitch
        ? 'images/pencil.png'
        : _purchaseSwitch
            ? 'images/cart.png'
            : 'images/clock.png';
    Message.workList = textEditingController.text;
    Message.action = true;
  }

  onPurchanseBtnClick(value) {
    if (value) {
      if (_appointmentSwitch || _studySwitch) {
        _appointmentSwitch = false;
        _studySwitch = false;
      }
    }
  }

  onAppointmentBtnClick(value) {
    if (value) {
      if (_purchaseSwitch || _studySwitch) {
        _purchaseSwitch = false;
        _studySwitch = false;
      }
    }
  }

  onStudyBtnClick(value) {
    if (value) {
      if (_appointmentSwitch || _purchaseSwitch) {
        _appointmentSwitch = false;
        _purchaseSwitch = false;
      }
    }
  }
}
