import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/message.dart';

class TableListWheelListInsert extends StatefulWidget {
  const TableListWheelListInsert({super.key});

  @override
  State<TableListWheelListInsert> createState() =>
      _TableListWheelListInsertState();
}

class _TableListWheelListInsertState extends State<TableListWheelListInsert> {
  late TextEditingController textEditingController;
  late bool _purchaseSwitch;
  late bool _appointmentSwitch;
  late bool _studySwitch;

  late List<String> _imageName; // imageList
  late int _selectedItem; // 이미지 순번

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
    _purchaseSwitch = true;
    _appointmentSwitch = false;
    _studySwitch = false;
    Message.imagePath = 'images.cart.png';
    _imageName = [
      'clock.png',
      'pencil.png',
      'cart.png',
    ];
    _selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add View Wheel')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('images/${_imageName[_selectedItem]}'),
                SizedBox(
                  width: 120,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CupertinoPicker(
                        backgroundColor: Colors.blue,
                        itemExtent: 50,
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          _selectedItem = value;
                          setState(() {});
                        },
                        children: List.generate(
                            _imageName.length,
                            (index) => Center(
                                  child: Image.asset(
                                    'images/${_imageName[index]}',
                                    width: 50,
                                  ),
                                ))),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: '목록을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 40),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text('OK'),
              ),
            )
          ],
        ));
  }

  addList() {
    Message.imagePath = 'images/${_imageName[_selectedItem]}';
    Message.workList = textEditingController.text;
    Message.action = true;
  }

  switchValueCheck() {
    if (!_appointmentSwitch && !_studySwitch && !_purchaseSwitch) {
      _purchaseSwitch = true;
    }
  }
}
