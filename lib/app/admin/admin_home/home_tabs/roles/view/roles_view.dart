
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/component/home_component.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/bottom_sheet.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class RolesView extends StatelessWidget {
  RolesView({Key? key}) : super(key: key);

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
                                color: AppColor.white,
                              )),
                        ),
                        AppText(
                          title: "Roles Management",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        GestureDetector(
                          onTap: (){
                            homeController.clear();

                            dialogeAlert(onTap: (){
                              if(validateRole(context)){
                                Get.back();
                                showLoading(context: context);
                                ApiManger().addUserRole(context: context);
                              }

                            },


                              hint: "Role Name",controller: homeController.roleRegController
                            ,  hint1:"Role Name",
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
          SizedBox(
            height: Get.height * 0.005,
          ),


          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
            child: Material(
              elevation: 2,
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColor.btnColor.withOpacity(0.8))
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                    maxLines: 1,
                    style: TextStyle(fontFamily: AppFont.regular, fontSize:  AppSizes.size_15,fontWeight: FontWeight.w500,
                      color:
                      AppColor.white.withOpacity(0.8),
                    ),

                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColor.white.withOpacity(0.8),
                        ),

                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppColor.white.withOpacity(0.8),
                          fontFamily: AppFont.regular,
                        ),
                        border: InputBorder.none),

                    onChanged: (val) {
                      Get.put(HomeController()).getUserRolesData(id: val.toString());

                      debugPrint(val);
                    }),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),




          Expanded(
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height*0.01,),

                      Obx(
                        () {
                          return
                            homeController.isRolLoading.value?loader():
                                homeController.userRolList.isNotEmpty?
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              reverse: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: homeController.userRolList.length,
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
                                                textAuth2(text:"Roll Name :  "),

                                                textAuth(text:homeController.userRolList[index].name),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap:(){
                                                    homeController.roleRegController.text=homeController.userRolList[index].name.toString();

                                                    dialogeAlert(onTap: (){
                                                      if(validateRole(context)){
                                                        Get.back();
                                                        showLoading(context: context);
                                                        ApiManger().updateRoleResponse(context: context,
                                                        id: homeController.userRolList[index].id.toString()
                                                        );
                                                      }

                                                    },


                                                      hint: "Role Name",controller: homeController.roleRegController
                                                      ,  hint1:"Role Name",
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
                                                          ApiManger().deleteRole(id:homeController.userRolList[index].id.toString() );
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





                                      ],
                                    ),
                                  ),
                                );
                              }):
                          noData()
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
    if (Get.put(HomeController()).roleRegController.text.isEmpty) {
      flutterToast(msg: "Please enter role name");
      return false;
    }

    return true;



  }}
