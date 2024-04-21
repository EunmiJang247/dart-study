import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_flutter_pract/view/day_10example2_detailView.dart';

class CollectionViewSecond extends StatefulWidget {
  const CollectionViewSecond({super.key});

  @override
  State<CollectionViewSecond> createState() => _CollectionViewSecondState();
}

class _CollectionViewSecondState extends State<CollectionViewSecond> {
  late List<String> flowerList;

  @override
  void initState() {
    super.initState();
    flowerList = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flower Garden'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              itemCount: flowerList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => pushAction(index),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Stack(
                          //워터마크 해주기 위해 wrap해줌.
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/${flowerList[index]}',
                                height: 100,
                              ),
                            ),
                            const RotationTransition(
                              turns: AlwaysStoppedAnimation(-45 / 360),
                              child: Text(
                                'all right reserved',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.card_travel,
                              color: Colors.amber,
                            ) //위로 겹치게 해주는 것.
                          ],
                        ),
                        Text(
                          flowerList[index].substring(7),
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  pushAction(index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailViewViewSecond(flowerName: flowerList[index]);
    }));
  }
}
