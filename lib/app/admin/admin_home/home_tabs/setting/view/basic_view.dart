import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';
import 'package:sebenza/app/widgets/image_pick.dart';

class BasicSettingView extends StatefulWidget {
   BasicSettingView({Key? key}) : super(key: key);


  @override
  State<BasicSettingView> createState() => _BasicSettingViewState();
}

class _BasicSettingViewState extends State<BasicSettingView> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      Get.put(HomeController()).titleBasicController.text=   Get.put(HomeController()).data.title==null?"":Get.put(HomeController()).data.title;
      Get.put(HomeController()).emailBasicController.text=  Get.put(HomeController()).data.email==null?"":Get.put(HomeController()).data.email;
      Get.put(HomeController()).contactBasicController.text= Get.put(HomeController()).data.contact==null?"":Get.put(HomeController()).data.contact;
      Get.put(HomeController()).addressBasicController.text= Get.put(HomeController()).data.address==null?"":Get.put(HomeController()).data.address;
      Get.put(HomeController()).metaNameController.text= Get.put(HomeController()).data.siteName==null?"":Get.put(HomeController()).data.siteName;
      Get.put(HomeController()).metDesController.text= Get.put(HomeController()).data.metaDescription==null?"":Get.put(HomeController()).data.metaDescription;
      Get.put(HomeController()).metKeyWordsController.text= Get.put(HomeController()).data.metaKeyword==null?"":Get.put(HomeController()).data.metaKeyword;
      Get.put(HomeController()).pixController.text= Get.put(HomeController()).data.facebookPixel==null?"":Get.put(HomeController()).data.facebookPixel;
      Get.put(HomeController()).analyticsController.text= Get.put(HomeController()).data.googleAnalytics==null?"":Get.put(HomeController()).data.googleAnalytics;



      Get.put(HomeController()).faceController.text= Get.put(HomeController()).data.facebook==null?"":Get.put(HomeController()).data.facebook;
      Get.put(HomeController()).googleController.text= Get.put(HomeController()).data.google==null?"":Get.put(HomeController()).data.google;
      Get.put(HomeController()).instaController.text= Get.put(HomeController()).data.instagram==null?"":Get.put(HomeController()).data.instagram;
      Get.put(HomeController()).twitController.text= Get.put(HomeController()).data.twitter==null?"":Get.put(HomeController()).data.twitter;
      Get.put(HomeController()).tikController.text= Get.put(HomeController()).data.tiktok==null?"":Get.put(HomeController()).data.tiktok;
      Get.put(HomeController()).rssController.text= Get.put(HomeController()).data.rss==null?"":Get.put(HomeController()).data.rss;
      Get.put(HomeController()).youController.text= Get.put(HomeController()).data.youtube==null?"":Get.put(HomeController()).data.youtube;
      Get.put(HomeController()).linkController.text= Get.put(HomeController()).data.linkedin==null?"":Get.put(HomeController()).data.linkedin;
      Get.put(HomeController()).pintController.text= Get.put(HomeController()).data.pinterest==null?"":Get.put(HomeController()).data.pinterest;
    });

  }

  @override
  Widget build(BuildContext context) {
    print( Get.put(HomeController()).data.title);
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.secColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: AppColor.primaryColor,
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
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  child: Icon(Icons.arrow_back_ios,
                                      color: AppColor.white)),
                            ),
                            AppText(
                              title: "Basic Settings",
                              color: AppColor.white,
                              size: AppSizes.size_17,
                              fontFamily: AppFont.medium,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: Get.height * 0.042,
                                width: Get.height * 0.042,
                                decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Get.height * 0.1))),
                                child: Icon(
                                  Icons.add,
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
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      AppText(
                        title: "BASIC INFO",
                        color: AppColor.white,
                        size: AppSizes.size_17,
                        fontFamily: AppFont.regular,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Title"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          }
                          if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                            return null;
                          }
                          return null;
                        },
                        hint: "Title",
                        controller: homeController.titleBasicController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Email", color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.013,
                      ),
                      sabenzaField(
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                          hint: "Example@gmail.com",
                          controller: homeController.emailBasicController,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Contact"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        hint: "Contact",
                        controller: homeController.contactBasicController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Address"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          }
                          if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                            return null;
                          }
                          return null;
                        },
                        hint: "Your Address",
                        controller: homeController.addressBasicController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Upload Logo"),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Get.put(HomeController()).data.logo == null
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                color: Colors.transparent,
                                width: Get.height * 0.1,
                                height: Get.height * 0.1,
                                child: DottedBorder(
                                    color: Colors.grey,
                                    dashPattern: [8, 4],
                                    strokeWidth: 1.8,
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
                                                        Get.put(HomeController())
                                                            .basicFile = value!;
                                                      });
                                                    });
                                                  }, onGallery: () {
                                                    Navigator.pop(context);
                                                    HelperFunctions.pickImage(
                                                            ImageSource.gallery)
                                                        .then((value) {
                                                      setState(() {
                                                        Get.put(HomeController())
                                                            .basicFile = value!;
                                                      });
                                                    });
                                                  }));
                                        },
                                        child:
                                        Get.put(HomeController()).basicFile==null?

                                        Center(
                                          child:


                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [

                                              SvgPicture.asset(
                                                "assets/icons/photo.svg",
                                                height: Get.height * 0.03,
                                              ),
                                            ],
                                          ),
                                        ):Image.file(homeController.basicFile as File),
                                      ),
                                    )),
                              ),
                            )
                          : Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                color: Colors.transparent,
                                width: Get.height * 0.1,
                                height: Get.height * 0.1,
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
                                                  Get.put(HomeController())
                                                      .basicFile = value!;
                                                });
                                              });
                                            }, onGallery: () {
                                              Navigator.pop(context);
                                              HelperFunctions.pickImage(
                                                      ImageSource.gallery)
                                                  .then((value) {
                                                setState(() {
                                                  Get.put(HomeController())
                                                      .basicFile = value!;
                                                });
                                              });
                                            }));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(

                                      homeController.data.logo==null?"":homeController.data.logo,
                                      fit: BoxFit.cover,
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
                                  ),
                                ),
                              ),
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
                              buttonName: "Update Settings",
                              fontWeight: FontWeight.w500,
                              textSize: AppSizes.size_13,
                              buttonColor: AppColor.btnColor,
                              textColor: AppColor.whiteColor,
                              onTap: () {
                                if(validateBasic(context)){
                                  homeController.updateBasicLoader(true);
                                  ApiManger().updateBasicResponse(context: context,
                                  title: homeController.titleBasicController.text,
                                    email: homeController.emailBasicController.text,
                                    contact: homeController.contactBasicController.text,
                                    address: homeController.addressBasicController.text
                                  );
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      AppText(
                        title: "SEO METADATA INFO",
                        color: AppColor.white,
                        size: AppSizes.size_17,
                        fontFamily: AppFont.regular,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Site Name"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        hint: "Site Name",
                        controller: homeController.metaNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Meta Description"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        max: 2,

                        hint: "Meta Description",
                        controller: homeController.metDesController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Meta Keywords"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        hint: "Meta Keywords",
                        controller: homeController.metKeyWordsController,
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
                              buttonName: "Update Settings",
                              fontWeight: FontWeight.w500,
                              textSize: AppSizes.size_13,
                              buttonColor: AppColor.btnColor,
                              textColor: AppColor.whiteColor,
                              onTap: () {
                                if(validateMeta(context)){
                                  homeController.updateBasicLoader(true);
                                  ApiManger().updateMeta(
                                      name: homeController.metaNameController.text,
                                      des: homeController.metDesController.text,
                                      key: homeController.metKeyWordsController.text,

                                  );
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      AppText(
                        title: "PIXEL ANALYTICS",
                        color: AppColor.white,
                        size: AppSizes.size_17,
                        fontFamily: AppFont.regular,
                      ),

                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Facebook Pixel"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Facebook Pixel",
                        controller: homeController.pixController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Google Analytics"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        hint: "Google Analytics",
                        controller: homeController.analyticsController,
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
                              buttonName: "Update Settings",
                              fontWeight: FontWeight.w500,
                              textSize: AppSizes.size_13,
                              buttonColor: AppColor.btnColor,
                              textColor: AppColor.whiteColor,
                              onTap: () {
                                if(validateFace(context)){
                                  homeController.updateBasicLoader(true);
                                  ApiManger().updateFace(
                                    face: homeController.pixController.text,
                                    google: homeController.analyticsController.text,


                                  );
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      AppText(
                        title: "SOCIAL SETTINGS",
                        color: AppColor.white,
                        size: AppSizes.size_17,
                        fontFamily: AppFont.regular,
                      ),

                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Facebook"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Facebook",
                        controller: homeController.faceController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Instagram"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Instagram",
                        controller: homeController.instaController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Tiktok"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Tiktok",
                        controller: homeController.tikController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Pinterest"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Pinterest",
                        controller: homeController.pintController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Twitter"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Twitter",
                        controller: homeController.twitController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Google"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "Google",
                        controller: homeController.googleController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "RSS"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "RSS",
                        controller: homeController.rssController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "LinkedIn"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "LinkedIn",
                        controller: homeController.linkController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "YouTube"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(

                        hint: "YouTube",
                        controller: homeController.youController,
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
                              buttonName: "Update Settings",
                              fontWeight: FontWeight.w500,
                              textSize: AppSizes.size_13,
                              buttonColor: AppColor.btnColor,
                              textColor: AppColor.whiteColor,
                              onTap: () {
                                homeController.updateBasicLoader(true);
                                ApiManger().updateSocials(
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
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
    );
  }

  bool validateBasic(BuildContext context) {
    if (Get.put(HomeController()).titleBasicController.text.isEmpty) {
      flutterToast(msg: "Please enter title");
      return false;
    }
    if (Get.put(HomeController()).emailBasicController.text.isEmpty) {
      flutterToast(msg: "Please enter email");
      return false;
    }
    if (Get.put(HomeController()).contactBasicController.text.isEmpty) {
      flutterToast(msg: "Please enter contact number");
      return false;
    }
    if (Get.put(HomeController()).addressBasicController.text.isEmpty) {
      flutterToast(msg: "Please enter address");
      return false;
    }



    return true;
  }


  bool validateMeta(BuildContext context) {
    if (Get.put(HomeController()).metaNameController.text.isEmpty) {
      flutterToast(msg: "Please enter site name");
      return false;
    }
    if (Get.put(HomeController()).metDesController.text.isEmpty) {
      flutterToast(msg: "Please enter meta description");
      return false;
    }
    if (Get.put(HomeController()).metKeyWordsController.text.isEmpty) {
      flutterToast(msg: "Please enter keywords");
      return false;
    }




    return true;
  }


  bool validateFace(BuildContext context) {
    if (Get.put(HomeController()).pixController.text.isEmpty) {
      flutterToast(msg: "Please enter facebook analytics");
      return false;
    }
    if (Get.put(HomeController()).analyticsController.text.isEmpty) {
      flutterToast(msg: "Please enter google analytics");
      return false;
    }





    return true;
  }
}
