// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';



import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';


class HelperFunctions {


  static Future<File?> pickImage(ImageSource imageSource) async {
    File imageFile;
    final file = await ImagePicker().pickImage(source: imageSource,imageQuality: 20);
    if (file != null) {
      imageFile = File(file.path);
      return imageFile;
    } else {
      print("No image selected");
    }
    return null;
  }


  static saveInPreference(String preName, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(preName, value);
    print('Bismillah: In save preference function');
  }

  static Future<String> getFromPreference(String preName) async {
    String returnValue = "";

    final prefs = await SharedPreferences.getInstance();
    returnValue = prefs.getString(preName) ?? "";
    return returnValue;
  }



  Future<bool>  clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return true;
  }
}

Future<bool> signout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}

Widget loader(){
  return Column(
    children: [
      SizedBox(
        height: Get.height * 0.35,
      ),
       Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white.withOpacity(0.8),
            valueColor: AlwaysStoppedAnimation<Color>(
                AppColor.btnColor //<-- SEE HERE

            ),
          )),
    ],
  );
}
Widget noData(){
  return Column(children: [
    SizedBox(height: Get.height * 0.35),
    SvgPicture.asset(
      "assets/images/notfound.svg",
      height: Get.height * 0.05,
    ),
    SizedBox(height: Get.height * 0.015),
    Center(
        child: AppText(
          title: "No Record Found",
          size: Get.height * 0.015,
          color: AppColor.white.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        )),
    SizedBox(height: Get.height * 0.01),
  ]);
}


Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),    color: Colors.white,),
          height: 100,
          width: 100,

        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 18.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                width: double.infinity,
                height: 14.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                width: double.infinity,
                height: 14.0,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
