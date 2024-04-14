import 'package:flutter/material.dart';

class TodoList {
  // Property
  String imagePath; //model이라 late안달아도 돼
  String workList;
  Color listColor;

  // Constructor
  TodoList({
    //생성자이기 때문에 ()를 쓰는것이다
    required this.imagePath,
    required this.workList,
    required this.listColor,
  });
}
