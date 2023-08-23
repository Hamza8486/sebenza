
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/tabs_data/answered.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/tabs_data/closed.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/tabs_data/pending.dart';

import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class TicketsView extends StatelessWidget {
  TicketsView({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());




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
                            Get.put(HomeController()).updateTab(0);
                            Get.back();
                          },
                          child: Container(
                              color: Colors.transparent,

                              child: Icon(Icons.arrow_back_ios,
                                color: AppColor.white,
                              )),
                        ),
                        AppText(
                          title: "Tickets System",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        Container()

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height*0.01,),
          Obx(
                  () {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                  child: Material(
                    color: AppColor.btnColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColor.btnColor)
                    ),

                    child: SizedBox(
                        width: Get.width,

                        height: Get.height * 0.054,
                        child:    Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Expanded(
                                child: tabBusinessList1(
                                  text: "Pending",
                                  onTap: () {

                                    homeController.updateTab(0);
                                  },
                                  color: !(homeController.tab.value == 0)
                                      ? AppColor.btnColor
                                      : AppColor.primaryColor,
                                  color1: !(homeController.tab.value == 0)
                                      ? AppColor.white
                                      : AppColor.whiteColor,
                                ),
                              ),

                              Expanded(
                                child: tabBusinessList1(
                                  text: "Answered",
                                  onTap: () {
                                    homeController.updateTab(1);
                                  },
                                  color: !(homeController.tab.value == 1)
                                      ? AppColor.btnColor
                                      : AppColor.primaryColor,
                                  color1: !(homeController.tab.value == 1)
                                      ? AppColor.white
                                      : AppColor.whiteColor,
                                ),
                              ),

                              Expanded(
                                child: tabBusinessList1(
                                  text: "Closed",
                                  onTap: () {
                                    homeController.updateTab(2);
                                  },
                                  color: !(homeController.tab.value == 2)
                                      ? AppColor.btnColor
                                      : AppColor.primaryColor,
                                  color1: !(homeController.tab.value == 2)
                                      ? AppColor.white
                                      : AppColor.whiteColor,
                                ),
                              ),

                            ],
                          ),
                        )
                    ),
                  ),
                );
              }
          ),
          SizedBox(height: Get.height*0.005,),

          Expanded(
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Obx(
                              () {
                            return

                            homeController.isTickLoading.value?
                                loader():


                              homeController.tab.value == 0? PendingView():homeController.tab.value == 1?
                              Answered():Closed();
                          }
                      ),






                    ],
                  ),
                ),
              )
          ),



        ],
      ),
    );
  }


  Widget tabBusinessList1({text, color, color1, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.06, vertical: 5),
          child: Center(
            child: AppText(
              title: text,
              color: color1,
              size: AppSizes.size_12,
              fontFamily: AppFont.medium,
            ),
          ),
        ),
      ),
    );
  }
}
