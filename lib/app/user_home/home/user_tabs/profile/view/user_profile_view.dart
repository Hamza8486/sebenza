
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/user_home/home/user_tabs/profile/component/edit.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';




class UserProfileView extends StatelessWidget {
  UserProfileView({Key? key}) : super(key: key);

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
                                  color:AppColor.white
                              )),
                        ),
                        AppText(
                          title: "User Profile",
                          color:AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(UserEditProfile());
                          },
                          child: Container(
                            height: Get.height * 0.042,
                            width: Get.height * 0.042,
                            decoration: BoxDecoration(
                                color: AppColor.btnColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Get.height * 0.1))),
                            child: Icon(
                              Icons.edit,
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






          Obx(
                  () {
                return
                  homeController.profileLoading.value?
                  loader():
                  homeController.userProfileData==null?noData():

                  Expanded(
                      child:  Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                              Center(
                                child: Obx(() {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.132,
                                    width: MediaQuery.of(context).size.height * 0.132,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        Get.put(UserController()).image.value.isNotEmpty?  BorderRadius.circular(100):
                                        BorderRadius.circular(100),
                                        border:
                                        Border.all(color: AppColor.primaryColor, width: 2)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Obx(
                                              () {
                                            return


                                              CachedNetworkImage(
                                                placeholder: (context, url) =>Center(
                                                    child: SpinKitThreeBounce(
                                                        size: 16, color: AppColor.btnColor)
                                                ),
                                                imageUrl:Get.put(UserController()).image.value,
                                                fit: Get.put(UserController()).name.value.isEmpty
                                                    ? BoxFit.cover
                                                    : BoxFit.cover,
                                                errorWidget: (context, url, error) => ClipRRect(
                                                  borderRadius:


                                                  BorderRadius.circular(100),
                                                  child: Image.asset(
                                                    'assets/images/person.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                          }
                                      ),
                                    ),
                                  );
                                }),
                              ),

                              SizedBox(
                                height: Get.height * 0.045,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppText(
                                          title: "First Name",
                                          size: AppSizes.size_14,
                                          fontFamily: AppFont.medium,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white.withOpacity(0.8),
                                        ),
                                        SizedBox(height: Get.height*0.01,),


                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.btnColor,width: 1.2)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                            child: AppText(
                                              title:(homeController.userProfileData?.user?.firstName).toString(),
                                              size: AppSizes.size_14,
                                              fontFamily: AppFont.medium,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                  SizedBox(width: Get.width*0.05,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppText(
                                          title: "Last Name",
                                          size: AppSizes.size_14,
                                          fontFamily: AppFont.medium,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white.withOpacity(0.8),
                                        ),
                                        SizedBox(height: Get.height*0.01,),


                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.btnColor,width: 1.2)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                            child: AppText(
                                              title:(homeController.userProfileData?.user?.lastName).toString(),
                                              size: AppSizes.size_14,
                                              fontFamily: AppFont.medium,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                              AppText(
                                title: "Email",
                                size: AppSizes.size_14,
                                fontFamily: AppFont.medium,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white.withOpacity(0.8),
                              ),
                              SizedBox(height: Get.height*0.01,),


                              Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.btnColor,width: 1.2)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                    child: AppText(
                                      title:(homeController.userProfileData?.user?.email).toString(),
                                      size: AppSizes.size_14,
                                      fontFamily: AppFont.medium,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white.withOpacity(0.8),
                                    ),)),

                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                              AppText(
                                title: "Phone Number",
                                size: AppSizes.size_14,
                                fontFamily: AppFont.medium,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white.withOpacity(0.8),
                              ),
                              SizedBox(height: Get.height*0.01,),


                              Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.btnColor,width: 1.2)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                    child: AppText(
                                      title:(homeController.userProfileData?.user?.phone).toString(),
                                      size: AppSizes.size_14,
                                      fontFamily: AppFont.medium,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white.withOpacity(0.8),
                                    ),)),

                              SizedBox(
                                height: Get.height * 0.025,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppText(
                                          title: "Country",
                                          size: AppSizes.size_14,
                                          fontFamily: AppFont.medium,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white.withOpacity(0.8),
                                        ),
                                        SizedBox(height: Get.height*0.01,),


                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.btnColor,width: 1.2)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                            child: AppText(
                                              title:(homeController.userProfileData?.user?.country==null?"":homeController.userProfileData?.user?.country).toString(),
                                              size: AppSizes.size_14,
                                              fontFamily: AppFont.medium,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                  SizedBox(width: Get.width*0.05,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppText(
                                          title: "State",
                                          size: AppSizes.size_14,
                                          fontFamily: AppFont.medium,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white.withOpacity(0.8),
                                        ),
                                        SizedBox(height: Get.height*0.01,),


                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.btnColor,width: 1.2)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                            child: AppText(
                                              title:(
                                                  homeController.userProfileData?.user?.state==null?"":
                                                  homeController.userProfileData?.user?.state).toString(),
                                              size: AppSizes.size_14,
                                              fontFamily: AppFont.medium,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: Get.height * 0.025,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppText(
                                          title: "City",
                                          size: AppSizes.size_14,
                                          fontFamily: AppFont.medium,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white.withOpacity(0.8),
                                        ),
                                        SizedBox(height: Get.height*0.01,),


                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.btnColor,width: 1.2)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                            child: AppText(
                                              title:(

                                                  homeController.userProfileData?.user?.city==null?"":
                                                  homeController.userProfileData?.user?.city).toString(),
                                              size: AppSizes.size_14,
                                              fontFamily: AppFont.medium,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                  SizedBox(width: Get.width*0.05,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppText(
                                          title: "Postal Code",
                                          size: AppSizes.size_14,
                                          fontFamily: AppFont.medium,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white.withOpacity(0.8),
                                        ),
                                        SizedBox(height: Get.height*0.01,),


                                        Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.btnColor,width: 1.2)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                            child: AppText(
                                              title:(
                                                  homeController.userProfileData?.user?.postcode==null?"":
                                                  homeController.userProfileData?.user?.postcode).toString(),
                                              size: AppSizes.size_14,
                                              fontFamily: AppFont.medium,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                              AppText(
                                title: "Address",
                                size: AppSizes.size_14,
                                fontFamily: AppFont.medium,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white.withOpacity(0.8),
                              ),
                              SizedBox(height: Get.height*0.01,),


                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColor.btnColor,width: 1.2)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
                                  child: AppText(
                                    title:(
                                        homeController.userProfileData?.user?.address==null?"":
                                        homeController.userProfileData?.user?.address).toString(),
                                    size: AppSizes.size_14,
                                    fontFamily: AppFont.medium,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white.withOpacity(0.8),
                                  ),
                                ),
                              ),



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
