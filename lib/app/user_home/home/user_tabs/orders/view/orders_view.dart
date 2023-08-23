
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/component/home_component.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/component/user_component.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class UserOrders extends StatelessWidget {
  UserOrders({Key? key}) : super(key: key);

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
                          title: "My Orders History",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        GestureDetector(
                          onTap: (){
                            homeController.clear();
                            addOrdersDialg(onTap: (){
                              if(validateRole(context)){
                                Get.back();
                                showLoading(context: context);
                                ApiManger().updatePackages(context: context,
                                );
                              }

                            },


                              hint: "Number of users",controller: homeController.users
                              ,  hint1:"Number of users:",

                            );

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
                              homeController.isOrdersLoading.value?loader():
                              homeController.userOrderList==null?noData():
                              Card(
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

                                              textAuth(text:"Users Subscription",
                                              ),
                                            ],
                                          ),
                                          Container(

                                            decoration:BoxDecoration(color:
                                            (homeController.userOrderList?.status).toString()=="Pending"?
                                            Colors.pinkAccent:


                                            AppColor.btnColor,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                              child: AppText(
                                                title: (homeController.userOrderList?.status).toString(),
                                                size: AppSizes.size_14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: AppFont.regular,
                                                color: AppColor.white.withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height*0.015,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              textAuth2(text:"ORDER ID# :  "),

                                              textAuth(text:homeController.userOrderList?.id.toString()),
                                            ],
                                          ),
                                          textAuth(text:homeController.userOrderList?.orderDate.toString(),
                                          textColor: Colors.white.withOpacity(0.8)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height*0.017,),
                                      Row(

                                        children: [
                                          textAuth2(text:"Total Users : "),

                                          textAuth(text:homeController.userOrderList?.accountTotalUser.toString()),


                                        ],
                                      ),
                                      SizedBox(height: Get.height*0.017,),
                                      Row(

                                        children: [
                                          textAuth2(text:"Total Amount : "),

                                          textAuth(text:homeController.userOrderList?.amountTotal.toString()),


                                        ],
                                      ),
                                      SizedBox(height: Get.height*0.015,),
                                      Row(
                                        children: [

                                          GestureDetector(
                                            onTap:


                                                (){
                                              // launch(homeController.announceList[index].postImage.toString());
                                            },
                                            child: Container(
                                              decoration:BoxDecoration(
                                                  border: Border.all(color: Colors.tealAccent),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.009),
                                                child: AppText(
                                                  title: "\$ Pay Invoice",
                                                  size: AppSizes.size_15,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: AppFont.regular,
                                                  color: Colors.tealAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: Get.width*0.03,),
                                          // GestureDetector(
                                          //   onTap:
                                          //
                                          //
                                          //       (){
                                          //    // launch(homeController.announceList[index].postImage.toString());
                                          //   },
                                          //   child: Container(
                                          //     decoration:BoxDecoration(
                                          //         border: Border.all(color: AppColor.btnColor),
                                          //         borderRadius: BorderRadius.circular(10)
                                          //     ),
                                          //     child: Padding(
                                          //       padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.009),
                                          //       child: Row(
                                          //         children: [
                                          //           Icon(Icons.remove_red_eye,color:AppColor.btnColor,
                                          //             size: Get.height*0.02,
                                          //           ),
                                          //           SizedBox(width: Get.width*0.005,),
                                          //           AppText(
                                          //             title: "Details",
                                          //             size: AppSizes.size_15,
                                          //             fontWeight: FontWeight.w500,
                                          //             fontFamily: AppFont.regular,
                                          //             color: AppColor.btnColor,
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                              );
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
  bool validateRole(BuildContext context) {
    if (Get.put(UserController()).users.text.isEmpty) {
      flutterToast(msg: "Please enter user");
      return false;
    }

    return true;



  }


}
