import 'package:flutter/material.dart';

double calculateIndicatorLeftPosition(BuildContext context, int index) {
  final screenWidth = MediaQuery.of(context).size.width;
  final tabWidth = screenWidth / 2;
  final indicatorOffset = (tabWidth - 57) / 2;
  return index * tabWidth + indicatorOffset;
}
