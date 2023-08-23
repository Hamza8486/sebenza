
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';
import 'package:url_launcher/url_launcher.dart';



class UserAnnouncementView extends StatelessWidget {
  UserAnnouncementView({Key? key}) : super(key: key);

  final homeController = Get.put(UserController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secColor,
      body: Column(
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
                                color:AppColor.white,
                              )),
                        ),
                        AppText(
                          title: "Announcement",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        GestureDetector(
                          onTap: (){
                            homeController.clear();


                          },
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
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [



                      Obx(
                              () {
                            return
                              homeController.announceLoader.value?loader():
                              homeController.announceList.isNotEmpty?

                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount:homeController.announceList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        print(homeController.announceList[index].id.toString());
                                        print(homeController.announceList[index].slug.toString());
                                      },
                                      child: Card(
                                        margin: EdgeInsets.symmetric(
                                            vertical: Get.height * 0.012),
                                        color:AppColor.primaryColor,
                                        elevation: 1.5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            side: BorderSide(
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.2))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Get.width * 0.022,
                                              vertical: Get.height * 0.015),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textAuth2(text:"Title : "),

                                                      textAuth(text:homeController.announceList[index].title,
                                                      color: AppColor.transParent,
                                                      textColor: AppColor.btnColor,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.visibility_rounded,color: Colors.white.withOpacity(0.8),
                                                        size: 14,
                                                      ),
                                                      SizedBox(width: 5,),
                                                      AppText(
                                                        title: homeController.announceList[index].totalView.toString(),
                                                        size: AppSizes.size_12,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: AppFont.regular,
                                                        color: AppColor.white.withOpacity(0.8),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  textAuth2(text:"Des : "),

                                                  SizedBox(
                                                    width: Get.width*0.7,
                                                    child: AppText(
                                                      title: homeController.announceList[index].description,
                                                      size: AppSizes.size_13,
                                                      maxLines: 2,
                                                      overFlow: TextOverflow.ellipsis,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: AppFont.medium,
                                                      color: AppColor.white.withOpacity(0.8),
                                                    ),
                                                  ),


                                                ],
                                              ),


                                              SizedBox(height: Get.height*0.015,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Row(
                                                    children: [
                                                      AppText(
                                                        title: "Status : ",
                                                        size: AppSizes.size_13,
                                                        fontWeight: FontWeight.w600,
                                                        fontFamily: AppFont.medium,
                                                        color: AppColor.white,
                                                      ),
                                                      SizedBox(width: 5,),
                                                      AppText(
                                                        title: homeController.announceList[index].status,
                                                        size: AppSizes.size_13,
                                                        fontWeight: FontWeight.w600,
                                                        fontFamily: AppFont.medium,
                                                        color: AppColor.white.withOpacity(0.8),
                                                      ),
                                                    ],
                                                  ),


                                                  SizedBox(width: Get.width*0.03,),
                                                  Row(
                                                    children: [

                                                      GestureDetector(
                                                        onTap:
                                                        homeController.announceList[index].postImage==null?(){
                                                          flutterToast(msg: "No Data");
                                                        }:

                                                            (){
                                                          launch(homeController.announceList[index].postImage.toString());
                                                        },
                                                        child: Container(

                                                          decoration:BoxDecoration(color:
                                                          AppColor.btnColor,
                                                              borderRadius: BorderRadius.circular(10)
                                                          ),
                                                          child: Padding(
                                                            padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                            child: AppText(
                                                              title: "Download",
                                                              size: AppSizes.size_14,
                                                              fontWeight: FontWeight.w400,
                                                              fontFamily: AppFont.regular,
                                                              color: AppColor.white.withOpacity(0.8),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: Get.width*0.03,),
                                                      GestureDetector(
                                                        onTap:
                                                        homeController.announceList[index].postImage==null?(){
                                                          flutterToast(msg: "No Data");
                                                        }:

                                                        (){
                                                          launch(homeController.announceList[index].postImage.toString());
                                                        },
                                                        child: Container(
                                                          decoration:BoxDecoration(
                                                              border: Border.all(color: AppColor.btnColor),
                                                              borderRadius: BorderRadius.circular(10)
                                                          ),
                                                          child: Padding(
                                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.007),
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons.attach_file,color:AppColor.btnColor,
                                                                  size: Get.height*0.02,
                                                                ),
                                                                SizedBox(width: Get.width*0.005,),
                                                                AppText(
                                                                  title: "Visit",
                                                                  size: AppSizes.size_15,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontFamily: AppFont.regular,
                                                                  color: AppColor.btnColor,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )




                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }):noData();
                          }
                      )



                    ],
                  ),
                ),
              )
          ),


        ],
      ),
    );
  }


}
