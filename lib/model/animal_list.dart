import 'package:flutter/material.dart';

class AnimalList {
  String name;
  String species;
  bool flyExist;
  String imagePath;

  // Constructor
  AnimalList({
    //생성자이기 때문에 ()를 쓰는것이다
    required this.name,
    required this.species,
    required this.flyExist,
    required this.imagePath,
  });
}
