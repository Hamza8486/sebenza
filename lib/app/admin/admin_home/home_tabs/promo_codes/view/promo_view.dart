
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/annoucement/component/add_ann.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/promo_codes/components/add_promo.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class PromoView extends StatelessWidget {
  PromoView({Key? key}) : super(key: key);

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
                            Get.back();
                          },
                          child: Container(
                              color: Colors.transparent,

                              child: Icon(Icons.arrow_back_ios,
                                color:AppColor.white,
                              )),
                        ),
                        AppText(
                          title: "Promo Codes Management",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        GestureDetector(
                          onTap: (){
                            homeController.clear();
                            Get.to(AddPromo());

                          },
                          child: Container(
                            height: Get.height * 0.042,
                            width: Get.height * 0.042,
                            decoration: BoxDecoration(
                                color: AppColor.btnColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Get.height * 0.1))),
                            child: Icon(
                              Icons.add,
                              color: AppColor.whiteColor,
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
                              homeController.isPromoLoading.value?loader():
                              homeController.allPromo.isNotEmpty?

                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount:homeController.allPromo.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Card(
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
                                                    textAuth2(text:"Title :  "),

                                                    textAuth(text:homeController.allPromo[index].title),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:(){
                                                        homeController.clear();
                                                        Get.to(AddPromo(
                                                          data1: homeController.allPromo[index],
                                                          data: "update",
                                                        ));
                                                      },
                                                      child: Icon(Icons.edit,size: AppSizes.size_24,
                                                        color: AppColor.btnColor,
                                                      ),
                                                    ),
                                                    SizedBox(width: Get.width*0.04,),
                                                    GestureDetector(
                                                      onTap: (){
                                                        showAlertDialog(
                                                            context: context,
                                                            text: 'Do you want to delete it ? ',
                                                            yesOnTap: () {
                                                              Get.back();
                                                              showLoading(context: context);
                                                              ApiManger().deletePromo(id:homeController.allPromo[index].id.toString() );
                                                            });
                                                      },
                                                      child: Icon(Icons.delete,size: AppSizes.size_24,
                                                        color: Colors.red,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),


                                            SizedBox(height: Get.height*0.015,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.calendar_month,color: Colors.white.withOpacity(0.8),
                                                      size: 14,
                                                    ),
                                                    SizedBox(width: 5,),
                                                    AppText(
                                                      title:homeController.allPromo[index].expiredDate,
                                                      size: AppSizes.size_12,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: AppFont.regular,
                                                      color: AppColor.white.withOpacity(0.8),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration:BoxDecoration(color:
                                                  homeController.allPromo[index].status=="Active"?
                                                  Colors.green:Colors.grey,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                    child: AppText(
                                                      title: homeController.allPromo[index].status,
                                                      size: AppSizes.size_14,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: AppFont.regular,
                                                      color: AppColor.white.withOpacity(0.8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )




                                          ],
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
