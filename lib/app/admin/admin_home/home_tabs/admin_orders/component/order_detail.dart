
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';



class AdminOrderDetail extends StatelessWidget {
  AdminOrderDetail({Key? key,this.data}) : super(key: key);

  var data;

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
                          title: "User Subscription | Order Details",
                          color: AppColor.white,
                          size: AppSizes.size_16,
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




          Expanded(
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.08),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            title: "SERVICE	",
                            size: AppSizes.size_14,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white.withOpacity(0.7),
                          ),
                          AppText(
                            title: "DETAILS",
                            size: AppSizes.size_14,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white.withOpacity(0.7),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Divider(color: AppColor.white.withOpacity(0.7),),
                      SizedBox(height: Get.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            title: "Status",
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),
                          Container(

                            decoration:BoxDecoration(color:
                            (data.status).toString()=="Pending"?
                            Colors.pinkAccent:
                            (data.status).toString()=="Active"?
                            Colors.green:


                            AppColor.btnColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                              child: AppText(
                                title: (data.status).toString(),
                                size: AppSizes.size_14,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Divider(color: AppColor.white.withOpacity(0.7),),
                      SizedBox(height: Get.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            title: "Total users	",
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),
                          AppText(
                            title: data.accountTotalUser.toString(),
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),

                        ],
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Divider(color: AppColor.white.withOpacity(0.7),),
                      SizedBox(height: Get.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            title: "Order Date		",
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),
                          AppText(
                            title: data.orderDate.toString(),
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),

                        ],
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Divider(color: AppColor.white.withOpacity(0.7),),
                      SizedBox(height: Get.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            title: "Total Amount		",
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),
                          AppText(
                            title: data.amountTotal.toString(),
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white,
                          ),

                        ],
                      ),
                      SizedBox(height: Get.height*0.02,),
                      Divider(color: AppColor.white.withOpacity(0.7),),
                      SizedBox(height: Get.height*0.04,),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration:BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.greenAccent,width: 1.5)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                              child: AppText(
                                title:"\$ Pay Invoice",
                                size: AppSizes.size_14,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFont.regular,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
          )


        ],
      ),
    );
  }


}
