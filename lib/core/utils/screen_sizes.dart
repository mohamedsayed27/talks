
import 'package:flutter/material.dart';

class ScreenSize{
  final BuildContext context;
  ScreenSize(this.context);
  double wantedSize({required double size}){
    double wantedSize = 736/size;
    return MediaQuery.of(context).size.height/wantedSize;
  }
}