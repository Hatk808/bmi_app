import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hive/hive.dart';

part 'bmidata.g.dart';

@HiveType(typeId: 1)
class bmidata {
  bmidata({required this.gender, required this.height,required this.weight,required this.age,required this.name,required this.bmi});

  @HiveField(0)
  String? gender;

  @HiveField(1)
  double? height;

  @HiveField(2)
  double? weight;

  @HiveField(3)
  int? age;

  @HiveField(4)
  String? name;

  @HiveField(5)
  double? bmi;

}