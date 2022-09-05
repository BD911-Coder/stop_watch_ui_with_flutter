import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) => MediaQuery.of(context).size;

  static getScreenHeigh() {
    return Get.height;
  }

  static getScreenWeight() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double calculatedScreenHeight = getScreenHeigh() / pixels;
    return getScreenHeigh() / calculatedScreenHeight;
  }

  static getWidth(double pixels) {
    double calculatedScreenWidth = getScreenWeight() / pixels;
    return getScreenWeight() / calculatedScreenWidth;
  }
}
