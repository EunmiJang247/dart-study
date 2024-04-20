import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/animal_list.dart';
import 'package:second_flutter_pract/view/day_08example2FirstPage.dart';
import 'package:second_flutter_pract/view/day_08example2SecondPage.dart';

class Home4 extends StatefulWidget {
  const Home4({super.key});

  @override
  State<Home4> createState() => _Home4State();
}

class _Home4State extends State<Home4> with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<AnimalList> animalList;

  @override
  void initState() {
    super.initState();
    animalList = [];
    controller = TabController(length: 2, vsync: this);
    addData();
  }

  addData() {
    animalList.add(AnimalList(
        name: "벌", imagePath: "images/bee.png", species: "곤충", flyExist: true));
    animalList.add(AnimalList(
        name: "고양이",
        imagePath: "images/cat.png",
        species: "포유류",
        flyExist: true));
    animalList.add(AnimalList(
        name: "소",
        imagePath: "images/cow.png",
        species: "포유류",
        flyExist: true));
    animalList.add(AnimalList(
        name: "강아지",
        imagePath: "images/dog.png",
        species: "포유류",
        flyExist: true));
    animalList.add(AnimalList(
        name: "여우",
        imagePath: "images/fox.png",
        species: "포유류",
        flyExist: true));
    animalList.add(AnimalList(
        name: "돼지",
        imagePath: "images/pig.png",
        species: "포유류",
        flyExist: true));
    animalList.add(AnimalList(
        name: "원숭이",
        imagePath: "images/monkey.png",
        species: "영장류",
        flyExist: true));
    animalList.add(AnimalList(
        name: "늑대",
        imagePath: "images/wolf.png",
        species: "포유류",
        flyExist: true));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물친구찾기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          ListViewSecondFirstPage(list: animalList),
          ListViewSecondSecondPage(list: animalList)
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(Icons.looks_one),
            text: "One",
          ),
          Tab(
            icon: Icon(Icons.looks_two),
            text: "Two",
          ),
        ],
      ),
    );
  }
}
