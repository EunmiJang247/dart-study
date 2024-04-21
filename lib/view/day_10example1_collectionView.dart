import 'package:flutter/material.dart';
import 'package:second_flutter_pract/view/day_10example1_detailView.dart';

class CollectionViewFirst extends StatefulWidget {
  const CollectionViewFirst({super.key});

  @override
  State<CollectionViewFirst> createState() => _CollectionViewFirstState();
}

class _CollectionViewFirstState extends State<CollectionViewFirst> {
  // property
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = [
      '유비',
      '광우',
      '장비',
      '여포',
      '조조',
      '초선',
      '손견',
      '장양',
      '손책',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('삼국지 인물'),
        ),
        body: GridView.builder(
            itemCount: heroList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2), //fixed: 가로가 정의됨
            //crossAxisCount: 한줄에 세개 출력할꺼야
            //crossAxisSpacing패딩. 띄어줄 간격임.
            //mainAxisSpacing 이것도 패딩.
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.grey,
                child: GestureDetector(
                  onTap: () => pushAction(index),
                  child: Card(
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(heroList[index]),
                        Image.asset('images/pig.png', width: 80),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  pushAction(index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailHeroFirst(heroName: heroList[index]);
    }));
  }
}
