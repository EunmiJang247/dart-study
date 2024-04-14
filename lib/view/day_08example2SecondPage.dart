import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_flutter_pract/model/animal_list.dart';

class ListViewSecondSecondPage extends StatefulWidget {
  const ListViewSecondSecondPage({super.key, required this.list});
  final List<AnimalList> list;

  @override
  State<ListViewSecondSecondPage> createState() =>
      _ListViewSecondSecondPageState();
}

class _ListViewSecondSecondPageState extends State<ListViewSecondSecondPage> {
  // property
  late TextEditingController nameController; //TextField
  late int _radioValue; //radio button
  late bool flyExist; //checkbox
  late String _imagePath; //
  late String imageName;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = '';
    imageName = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            maxLength: 20,
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    _radioChange(value);
                  }),
              const Text('양서류'),
              Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    _radioChange(value);
                  }),
              const Text('파충류'),
              Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    _radioChange(value);
                  }),
              const Text('영장류')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('날 수 있나요?'),
              Checkbox(
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  })
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal, //좌우로 움직일꺼니까
              children: [
                GestureDetector(
                    onTap: () {
                      _imagePath = 'images/cow.png';
                      imageName = '젖소';
                      setState(() {});
                    },
                    child: Image.asset('images/cow.png', width: 80)),
                GestureDetector(
                    onTap: () {
                      _imagePath = 'images/pig.png';
                      imageName = '돼지';
                      setState(() {});
                    },
                    child: Image.asset('images/pig.png', width: 80)),
                GestureDetector(
                    onTap: () {
                      _imagePath = 'images/bee.png';
                      imageName = '벌';
                      setState(() {});
                    },
                    child: Image.asset('images/bee.png', width: 80)),
                GestureDetector(
                    onTap: () {
                      _imagePath = 'images/fox.png';
                      imageName = '여우';
                      setState(() {});
                    },
                    child: Image.asset('images/fox.png', width: 80)),
                GestureDetector(
                    onTap: () {
                      _imagePath = 'images/monkey.png';
                      imageName = '원숭이';
                      setState(() {});
                    },
                    child: Image.asset('images/monkey.png', width: 80)),
              ],
            ),
          ),
          Text(imageName),
          ElevatedButton(
              onPressed: () {
                _showDialog();
              },
              child: const Text('동물 추가하기'))
        ])),
      ),
    );
  }

  _radioChange(value) {
    _radioValue = value;
    setState(() {});
  }

  _showDialog() {
    var animal = AnimalList(
      imagePath: _imagePath,
      name: nameController.text,
      species: getKind(_radioValue),
      flyExist: flyExist,
    );
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('동물 추가하기'),
            content: Text('이 동물은 ${animal.name} 입니다 \n'
                '이 동물의 종류는 ${animal.species}입니다'
                '이 동물은 ${animal.flyExist ? "날수 있습니다" : "날 수 없습니다"}'),
            actions: [
              TextButton(
                  onPressed: () {
                    widget.list.add(animal);
                    Navigator.of(context).pop();
                  },
                  child: const Text('예')),
              TextButton(onPressed: () {}, child: const Text('아니오'))
            ],
          );
        });
  }

  String getKind(radioValue) {
    String radioValue = '';
    if (radioValue == 0) {
      radioValue = "양서류";
    } else if (radioValue == 1) {
      radioValue = "파충류";
    } else {
      radioValue = "포유류";
    }
    return radioValue;
  }
}
