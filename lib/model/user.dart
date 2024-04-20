import 'package:flutter/material.dart';

class User {
  String id;
  String password;

  // Constructor
  User({
    //생성자이기 때문에 ()를 쓰는것이다
    required this.id,
    required this.password,
  });
}
