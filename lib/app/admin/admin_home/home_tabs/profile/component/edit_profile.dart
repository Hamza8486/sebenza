
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';




class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final homeController = Get.put(HomeController());

  var nameController = TextEditingController();
  var lastController = TextEditingController();
  var phoneController = TextEditingController();
  File ? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text= (homeController.adminProfileData?.user?.firstName).toString();
    lastController.text= (homeController.adminProfileData?.user?.lastName).toString();
    phoneController.text= (homeController.adminProfileData?.user?.phone).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color:  AppColor.primaryColor,
                elevation: 2,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 8.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.03,
                            vertical: Get.height * 0.018),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Get.back();
                              },
                              child: Container(
                                  color: Colors.transparent,

                                  child: Icon(Icons.arrow_back_ios,
                                      color:AppColor.white
                                  )),
                            ),
                            AppText(
                              title: "Edit Profile",
                              color:AppColor.white,
                              size: AppSizes.size_17,
                              fontFamily: AppFont.medium,
                            ),
                            GestureDetector(
                              onTap: (){


                              },
                              child: Container(
                                height: Get.height * 0.042,
                                width: Get.height * 0.042,
                                decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Get.height * 0.1))),
                                child: Icon(
                                  Icons.edit,
                                  color: AppColor.primaryColor,
                                  size: AppSizes.size_20,
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),

              Expanded(child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child: SingleChildScrollView(
                  child: Column(children: [

                    SizedBox(
                      height: Get.height * 0.02,
                    ),

                    file!=null? Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(

                            color: Colors.transparent,
                            border: Border.all(color: Colors.white,),
                            borderRadius: BorderRadius.circular(1000)
                        ),
                        width: Get.height * 0.14,
                        height: Get.height * 0.14,
                        child: Center(
                          child: MaterialButton(
                            minWidth: Get.width,
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor:
                                  Colors.transparent,
                                  context: context,
                                  builder: (builder) =>
                                      bottomSheet(onCamera: () {
                                        Navigator.pop(context);
                                        HelperFunctions.pickImage(
                                            ImageSource.camera)
                                            .then((value) {
                                          setState(() {
                                            file = value!;
                                          });
                                        });
                                      }, onGallery: () {
                                        Navigator.pop(context);
                                        HelperFunctions.pickImage(
                                            ImageSource.gallery)
                                            .then((value) {
                                          setState(() {
                                            file = value!;
                                          });
                                        });
                                      }));
                            },
                            child:
                            file==null?

                            Center(
                              child:


                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [

                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: SvgPicture.asset(
                                      "assets/icons/photo.svg",
                                      height: Get.height * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                            ):ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.file(file as File,
                                fit: BoxFit.cover,

                                )),
                          ),
                        ),
                      ),
                    )
                        : Align(
                      alignment: Alignment.center,
                      child: Container(

                        decoration: BoxDecoration(

                            color: Colors.transparent,
                          border: Border.all(color: Colors.white,),
                          borderRadius: BorderRadius.circular(1000)
                        ),
                        width: Get.height * 0.14,
                        height: Get.height * 0.14,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (builder) =>
                                    bottomSheet(onCamera: () {
                                      Navigator.pop(context);
                                      HelperFunctions.pickImage(
                                          ImageSource.camera)
                                          .then((value) {
                                        setState(() {
                                          file = value!;
                                        });
                                      });
                                    }, onGallery: () {
                                      Navigator.pop(context);
                                      HelperFunctions.pickImage(
                                          ImageSource.gallery)
                                          .then((value) {
                                        setState(() {
                                          file = value!;
                                        });
                                      });
                                    }));
                          },
                          child: Obx(
                            () {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(

                                  homeController.image.value,
                                  fit:
                                  homeController.image.value.isEmpty? BoxFit.cover:

                                  BoxFit.cover,
                                  errorBuilder: (context, exception, stackTrace) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/icons/photo.svg",
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    textAuth(text: "First Name"),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    sabenzaField(
                      hint: "Enter First Name",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    textAuth(text: "Last Name", color: Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.013,
                    ),
                    sabenzaField(
                        hint: "Enter Last Name",
                        controller: lastController,
                        textInputType: TextInputType.name),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    textAuth(text: "Mobile"),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    sabenzaField(
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      hint: "Enter Mobile Number",
                      controller: phoneController,
                    ),


                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.03),
                        child: AppButton(
                            buttonWidth: Get.width * 0.4,
                            buttonHeight: Get.height * 0.05,
                            buttonRadius: BorderRadius.circular(10),
                            buttonName: "Update Profile",
                            fontWeight: FontWeight.w500,
                            textSize: AppSizes.size_13,
                            buttonColor: AppColor.btnColor,
                            textColor: AppColor.whiteColor,
                            onTap: () {
                              homeController.updateBasicLoader(true);
                              ApiManger().editProfile(name: nameController.text,last: lastController.text,
                              phone: phoneController.text,file: file
                              );

                            }),
                      ),
                    ),
                  ],),
                ),
              ))









            ],
          ),
          Obx(() {
            return homeController.loaderBasicUser.value == false
                ? SizedBox.shrink()
                : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.7),
              child: Center(
                  child:
                  SpinKitThreeBounce(size: 25, color: AppColor.white)),
            );
          })
        ],
      ),
    );
  }
}
