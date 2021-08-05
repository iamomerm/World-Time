import 'package:flutter/material.dart';

List<Shadow> border(int color, double size) {
  return [
    Shadow(offset: Offset(-size, -size), color: Color(color)),
    Shadow(offset: Offset(size, -size), color: Color(color)),
    Shadow(offset: Offset(size, size), color: Color(color)),
    Shadow(offset: Offset(-size, size), color: Color(color)),
  ];
}