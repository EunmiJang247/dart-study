import 'package:flutter/material.dart';

class DetailViewViewSecond extends StatefulWidget {
  final String flowerName;
  const DetailViewViewSecond({super.key, required this.flowerName});

  @override
  State<DetailViewViewSecond> createState() => _DetailViewViewSecondState();
}

class _DetailViewViewSecondState extends State<DetailViewViewSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.flowerName.substring(7)),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'images/${widget.flowerName}',
              width: 300,
            ),
          ),
        ));
  }
}
