
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/component/home_component.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_orders/component/order_detail.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class AdminOrders extends StatelessWidget {
  AdminOrders({Key? key}) : super(key: key);

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
                          title: "Orders History",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        Container(
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
                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: homeController.userOrderList?.orders?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return  Card(
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
                                                    textAuth2(text:"ORDER ID# :  "),

                                                    textAuth(text:homeController.userOrderList?.orders?[index].id.toString()),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:(){
                                                        homeController.clear();
                                                        addOrdersAdminDialg(onTap: (){
                                                          if(validateRole(context)){
                                                            Get.back();
                                                            showLoading(context: context);
                                                            ApiManger().updateAdminPackages(context: context,
                                                              id: homeController.userOrderList?.orders?[index].id.toString()
                                                            );
                                                          }

                                                        },


                                                          hint: "Number of users",controller: homeController.users
                                                          ,  hint1:"Number of users:",

                                                        );
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
                                                              ApiManger().deleteOrders(id:homeController.userOrderList?.orders?[index].id.toString() );
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
                                            SizedBox(height: Get.height*0.017,),
                                            Row(

                                              children: [
                                                textAuth2(text:"Total Users : "),

                                                textAuth(text:homeController.userOrderList?.orders?[index].accountTotalUser.toString()),


                                              ],
                                            ),
                                            SizedBox(height: Get.height*0.017,),
                                            Row(

                                              children: [
                                                textAuth2(text:"Total Amount : "),

                                                textAuth(text:homeController.userOrderList?.orders?[index].amountTotal.toString()),


                                              ],
                                            ),
                                            SizedBox(height: Get.height*0.015,),
                                            Row(
                                              children: [

                                                GestureDetector(
                                                  onTap:


                                                      (){
                                                        Get.to(AdminOrderDetail(data:homeController.userOrderList?.orders?[index] ,),
                                                            transition: Transition.rightToLeft
                                                        );                                                  },
                                                  child: Container(
                                                    decoration:BoxDecoration(
                                                        border: Border.all(color: AppColor.btnColor,),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.009),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.visibility_rounded,color: AppColor.btnColor,
                                                            size: 14,
                                                          ),
                                                          SizedBox(width: 5,),
                                                          AppText(
                                                            title: "Detail",
                                                            size: AppSizes.size_15,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: AppFont.regular,
                                                            color:AppColor.btnColor,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                SizedBox(width: Get.width*0.03,),
                                                Container(

                                                  decoration:BoxDecoration(color:
                                                  (homeController.userOrderList?.orders?[index].status).toString()=="Pending"?
                                                  Colors.pinkAccent:
                                                  (homeController.userOrderList?.orders?[index].status).toString()=="Active"?
                                                  Colors.green:


                                                  AppColor.btnColor,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                    child: AppText(
                                                      title: (homeController.userOrderList?.orders?[index].status).toString(),
                                                      size: AppSizes.size_14,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: AppFont.regular,
                                                      color: AppColor.white.withOpacity(0.8),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                    );
                                  })


                             ;
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
    if (Get.put(HomeController()).users.text.isEmpty) {
      flutterToast(msg: "Please enter user");
      return false;
    }

    return true;



  }


}
