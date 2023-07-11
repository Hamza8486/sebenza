

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';

class UploadMenu extends StatefulWidget {
  UploadMenu({Key? key,this.text}) : super(key: key);
  var text;


  @override
  State<UploadMenu> createState() => _UploadMenuState();
}

class _UploadMenuState extends State<UploadMenu> {
  final homeController = Get.put(HomeController());

  void pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc','png'],

    ).then((value) {
      if(value!= null )
      {
        homeController.file1 = File(value.paths.first!
        );
        setState(() {

        });
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap:
          pickImage,
          child: Container(
              height: Get.height * 0.047,
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(7)),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: AppText(
                    title: widget.text,
                    color: AppColor.whiteColor.withOpacity(0.8),
                    size: AppSizes.size_11,
                    fontFamily: AppFont.medium,
                  ),
                ),
              )


          ),
        ),
        homeController.file1 == null?Container():
        SizedBox(
          height: Get.height * 0.01,
        ),
        homeController.file1 == null?Container():
        GestureDetector(
          onTap: (){
            homeController.file1 = null;
          },
          child: AppText(
            title:  homeController.file1?.path.split('/file_picker/').last??"",
            color: AppColor.white,
            size: AppSizes.size_12,
            fontFamily: AppFont.semi,
          ),
        ),
      ],
    );
  }
}