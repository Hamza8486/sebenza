
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class AdminInvoiceDetailView extends StatelessWidget {
  AdminInvoiceDetailView({Key? key}) : super(key: key);

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
                          title: "Invoice Detail",
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




          Obx(
            () {
              return
                homeController.isDetailInvoiceLoading.value?loader():

                Expanded(
                  child:  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height*0.02,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                height: Get.height * 0.05,
                              ),

                              Column(
                                children: [
                                  AppText(
                                    title: "INVOICE",
                                    size: AppSizes.size_17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.medium,
                                    color: AppColor.white.withOpacity(0.7),
                                  ),
                                  SizedBox(height: Get.height*0.005,),
                                  AppText(
                                    title: (homeController.detailInvoice?.invoiceID).toString(),
                                    size: AppSizes.size_13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.7),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          SizedBox(height: Get.height*0.007,),
                          AppText(
                            title: "Sebenza Systems\n108\nGreat Russell St,\nLondon, WC1B 3NA.",
                            size: AppSizes.size_15,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white.withOpacity(0.7),
                          ),

                          SizedBox(height: Get.height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Balance Due",
                                    size: AppSizes.size_15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.7),
                                  ),
                                  SizedBox(height: Get.height*0.005,),
                                  AppText(
                                    title: "\$${(homeController.detailInvoice?.amountTotal).toString()}",
                                    size: AppSizes.size_15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.7),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Invoice to :",
                                    size: AppSizes.size_15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.5),
                                  ),
                                  SizedBox(height: Get.height*0.005,),
                                  AppText(
                                    title: (homeController.detailInvoice?.orders?.users?.companyName).toString(),
                                    size: AppSizes.size_14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.9),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Invoice Date : ",
                                    size: AppSizes.size_14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.4),
                                  ),
                                  SizedBox(height: Get.height*0.005,),
                                  AppText(
                                    title: "\$${(homeController.detailInvoice?.invoiceDate).toString()}",
                                    size: AppSizes.size_14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.7),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: Get.height*0.005,),
                          AppText(
                            title: (homeController.detailInvoice?.orders?.users?.firstName).toString(),
                            size: AppSizes.size_14,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white.withOpacity(0.7),
                          ),
                          SizedBox(height: Get.height*0.005,),
                          AppText(
                            title: (homeController.detailInvoice?.orders?.users?.country).toString(),
                            size: AppSizes.size_14,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.regular,
                            color: AppColor.white.withOpacity(0.7),
                          ),
                          SizedBox(height: Get.height*0.005,),
                          Row(
                            children: [
                              AppText(
                                title: "${(homeController.detailInvoice?.orders?.users?.country).toString()} , ",
                                size: AppSizes.size_14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                              AppText(
                                title: (homeController.detailInvoice?.orders?.users?.city).toString(),
                                size: AppSizes.size_14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height*0.03,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Description",
                                    size: AppSizes.size_14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.5),
                                  ),
                                  SizedBox(height: Get.height*0.013,),
                                  AppText(
                                    title: "Users Subscriptions",
                                    size: AppSizes.size_13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.9),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      AppText(
                                        title: "USERS",
                                        size: AppSizes.size_14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.6),
                                      ),
                                      SizedBox(height: Get.height*0.02,),
                                      AppText(
                                        title: (homeController.detailInvoice?.orders?.accountTotalUser).toString(),
                                        size: AppSizes.size_13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.9),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width*0.03,),

                                  Column(
                                    children: [
                                      AppText(
                                        title: "UNIT COST	",
                                        size: AppSizes.size_14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.6),
                                      ),
                                      SizedBox(height: Get.height*0.02,),
                                      AppText(
                                        title: "\$${(homeController.detailInvoice?.costPerUser).toString()}",
                                        size: AppSizes.size_13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.9),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width*0.03,),
                                  Column(
                                    children: [
                                      AppText(
                                        title: "TOTAL",
                                        size: AppSizes.size_14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.6),
                                      ),
                                      SizedBox(height: Get.height*0.02,),
                                      AppText(
                                        title: "\$${(homeController.detailInvoice?.amountTotal).toString()}",
                                        size: AppSizes.size_13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.9),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: Get.height*0.05,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                title: "Sub Total	",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                              SizedBox(width: Get.width*0.15,),
                              AppText(
                                title: "\$${(homeController.detailInvoice?.amountTotal).toString()}",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                title: "Discount",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                              SizedBox(width: Get.width*0.15,),
                              AppText(
                                title: "\$${(homeController.detailInvoice?.discount).toString()}",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color:
                                homeController.detailInvoice?.discount=="0.00"||homeController.detailInvoice?.discount=="0"?
                                    Colors.red:
                                AppColor.white.withOpacity(0.9),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                title: "Total	",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                              SizedBox(width: Get.width*0.15,),
                              AppText(
                                title: "\$${(homeController.detailInvoice?.amountTotal).toString()}",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                title: "Payment Made	",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                              SizedBox(width: Get.width*0.15,),
                              AppText(
                                title: "\$${(homeController.detailInvoice?.discount).toString()}",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color:
                                homeController.detailInvoice?.discount=="0.00"||homeController.detailInvoice?.discount=="0"?
                                Colors.red:
                                AppColor.white.withOpacity(0.9),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                title: "Balance Due	",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                              SizedBox(width: Get.width*0.15,),
                              AppText(
                                title: "\$${(homeController.detailInvoice?.payableAmount).toString()}",
                                size: AppSizes.size_15,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.regular,
                                color: AppColor.white.withOpacity(0.9),
                              ),
                            ],
                          ),

                          SizedBox(height: Get.height*0.04,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration:BoxDecoration(color:
                               AppColor.btnColor,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                                  child: Row(
                                    children: [
                                      Icon(Icons.send,
                                      color:AppColor.white.withOpacity(0.8),
                                        size: Get.height*0.024,
                                      ),
                                      SizedBox(width: Get.width*0.02,),
                                      AppText(
                                        title:"Pay Invoice",
                                        size: AppSizes.size_14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFont.regular,
                                        color: AppColor.white.withOpacity(0.8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )




                        ],
                      ),
                    ),
                  )
              );
            }
          ),


        ],
      ),
    );
  }


}
