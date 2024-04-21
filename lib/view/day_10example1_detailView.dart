import 'package:flutter/material.dart';

class DetailHeroFirst extends StatefulWidget {
  final String heroName;
  const DetailHeroFirst({super.key, required this.heroName});

  @override
  State<DetailHeroFirst> createState() => _DetailHeroFirstState();
}

class _DetailHeroFirstState extends State<DetailHeroFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('인물 보기'),
        ),
        body: Center(
          child: Text(widget.heroName), //상위에 있는 데이터는 widget으로 받아야돼!
        ));
  }
}
