import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/animal_list.dart';

class AnimalCardsList extends StatefulWidget {
  const AnimalCardsList({super.key});

  @override
  State<AnimalCardsList> createState() => _AnimalCardsListState();
}

class _AnimalCardsListState extends State<AnimalCardsList> {
  late List<AnimalList> animalList;

  @override
  void initState() {
    super.initState();
    animalList = [];
    addData();
  }

  addData() {
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/bee.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/cat.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/cow.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/dog.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/fox.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/pig.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/monkey.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/wolf.png",
        species: "영장류",
        feature: "귀여워요"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animal Cards"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: animalList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    popUpShow(index, context);
                  },
                  child: Card(
                      // 카드 앞에 return필수!!!
                      child: Row(
                    children: [
                      Image.asset(
                        animalList[index].imagePath,
                        width: 100,
                        height: 100,
                      ),
                      Text(" ${animalList[index].name}")
                    ],
                  )),
                );
              }),
        ));
  }

  popUpShow(index, context) {
    print(animalList[index].name);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // 조정할 AlertDialog의 테두리 둥근 정도
            ),
            title: Text(animalList[index].name),
            content: Text(
                animalList[index].species + '\n' + animalList[index].feature),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
                style: TextButton.styleFrom(
                    minimumSize: Size(80, 40),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text('확인'),
              ),
            ],
          );
        });
  }
}
