import 'package:flutter/cupertino.dart';

class Food {
  final String foodName;
  final String designation;
  final int fatContent;
  int value;
  final String imgUrl;
  final String location;
  bool isLiked;
  bool isSwipedOff;

  Food({
    @required this.designation,
    @required this.fatContent,
    @required this.foodName,
    @required this.value,
    @required this.imgUrl,
    @required this.location,
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}
