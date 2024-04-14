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
        name: "벌",
        imagePath: "images/bee.png",
        species: "곤충",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "고양이",
        imagePath: "images/cat.png",
        species: "포유류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "소",
        imagePath: "images/cow.png",
        species: "포유류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "강아지",
        imagePath: "images/dog.png",
        species: "포유류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "여우",
        imagePath: "images/fox.png",
        species: "포유류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "돼지",
        imagePath: "images/pig.png",
        species: "포유류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/monkey.png",
        species: "영장류",
        feature: "귀여워요"));
    animalList.add(AnimalList(
        name: "늑대",
        imagePath: "images/wolf.png",
        species: "포유류",
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
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: ValueKey(animalList[index]),
                  onDismissed: (direction) {
                    animalList.remove(animalList[index]);
                    setState(() {});
                  },
                  background: Container(
                      // 칼라를 주려고 콘테이너를 쓴다
                      color: Colors.green,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete_forever,
                              size: 50, color: Colors.white),
                          Text('삭제',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white))
                        ],
                      )),
                  child: GestureDetector(
                    onTap: () {
                      _popUpShow(index, context);
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
                        Text(
                          "      ${animalList[index].name}",
                        )
                      ],
                    )),
                  ),
                );
              }),
        ));
  }

  _popUpShow(index, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // 조정할 AlertDialog의 테두리 둥근 정도
            ),
            title: Text(
              animalList[index].name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
                '종류는: ${animalList[index].species}\n특징은: ${animalList[index].feature}',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //of를 붙여야 가장 위 콘텍스트를 지우게 된다
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
