
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/component/home_component.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_invoice/component/admin_invoice_detail.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class AdminInvoiceViews extends StatelessWidget {
  AdminInvoiceViews({Key? key}) : super(key: key);

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
                          title: "My Invoices",
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




          Expanded(
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [



                      Obx(
                              () {
                            return
                              homeController.invoiceLoader.value?loader():
                              homeController.invoiceList.isNotEmpty?

                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount:homeController.invoiceList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        homeController.getInvoiceDetailData(homeController.invoiceList[index].id.toString());
                                        Get.to(AdminInvoiceDetailView(),
                                            transition: Transition.rightToLeft
                                        );

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
                                                      textAuth(text:homeController.invoiceList[index].invoiceID.toString()),
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
                                                              ApiManger().updateAdminInvoice(context: context,
                                                                  id:homeController.invoiceList[index].id.toString()
                                                              );
                                                            }

                                                          },


                                                            hint: "Enter discount",controller: homeController.users
                                                            ,  hint1:"Discounts:",
                                                              text:"Invoice Update"

                                                          );
                                                        },
                                                        child: Icon(Icons.edit,size: AppSizes.size_24,
                                                          color: AppColor.btnColor,
                                                        ),
                                                      ),
                                                      SizedBox(width: Get.width*0.05,),
                                                      GestureDetector(
                                                        onTap: (){
                                                          showAlertDialog(
                                                              context: context,
                                                              text: 'Do you want to delete it ? ',
                                                              yesOnTap: () {
                                                                Get.back();
                                                                showLoading(context: context);
                                                                ApiManger().deleteInvoice(id:homeController.invoiceList[index].id.toString() );
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
                                              SizedBox(height: Get.height*0.02,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textAuth2(text:"Total Amount : "),

                                                      textAuth(text:homeController.invoiceList[index].amountTotal.toString()),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textAuth2(text:"Discount : "),

                                                      textAuth(text:homeController.invoiceList[index].discount.toString()),
                                                    ],
                                                  ),


                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      textAuth2(text:"Invoice Date : "),

                                                      textAuth(text:homeController.invoiceList[index].invoiceDate.toString()),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textAuth2(text:"Total User : "),

                                                      textAuth(text:homeController.invoiceList[index].accountTotalUser.toString()),
                                                    ],
                                                  ),


                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [


                                                  Container(
                                                    decoration:BoxDecoration(color:
                                                    homeController.invoiceList[index].status=="Paid"?
                                                    Colors.green:
                                                    Colors.red,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                      child: AppText(
                                                        title: homeController.invoiceList[index].status.toString(),
                                                        size: AppSizes.size_14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: AppFont.regular,
                                                        color: AppColor.white.withOpacity(0.8),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: Get.width*0.03,),
                                                  Container(
                                                    decoration:BoxDecoration(
                                                      border: Border.all(color: AppColor.btnColor),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                      child: AppText(
                                                        title: "\$ Invoice",
                                                        size: AppSizes.size_14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: AppFont.regular,
                                                        color: AppColor.btnColor,
                                                      ),
                                                    ),
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
  bool validateRole(BuildContext context) {
    if (Get.put(HomeController()).users.text.isEmpty) {
      flutterToast(msg: "Please enter discount");
      return false;
    }

    return true;



  }

}
