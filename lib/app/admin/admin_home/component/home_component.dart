import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/authentication/component.dart';

import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';

Widget WidgetDashboard({image,text,Widget ?icon,double?height}){
  return Container(
    decoration: BoxDecoration(
      color: AppColor.primaryColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 4,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.057,vertical: Get.height*0.02),
      child: Column(
        children: [
          icon??
          SvgPicture.asset(image,height: Get.height*0.048,),
          SizedBox(height: Get.height*0.013,),
          AppText(title: text,
            size:height?? AppSizes.size_14,
            fontFamily: AppFont.medium,
            color:AppColor.white.withOpacity(0.8),
          ),
        ],
      ),
    ),
  );

}

Widget imageWidget({image}){
  return   Container(
    height: Get.size.height * 0.06,
    width: Get.size.height * 0.06,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(
            color: AppColor.whiteColor, width: 1.5)),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,

          errorWidget: (context, url, error) => ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.asset(
              "assets/images/person.png",
              fit: BoxFit.cover,

            ),
          ),
        )
    ),
  );
}

Future<bool> dialogeAlert({TextEditingController?controller,hint="",hint1="",onTap}) async {
  HapticFeedback.lightImpact();
  bool clean = false;
  await Get.generalDialog(

      pageBuilder: (context, __, ___) => AlertDialog(

        content: SizedBox(
          height: Get.height*0.18,
          child: Column(
            children: [
              textAuth(text: hint1,
                  textColor:Colors.black
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              sabenzaField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  }
                  if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                    return null;
                  }
                  return null;
                },
                hint:hint,
                hintColor: AppColor.primaryColor.withOpacity(0.8),
                textColor: AppColor.primaryColor.withOpacity(0.8),
                controller: controller,
              ),
              SizedBox(height: Get.height*0.025,),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonHeight: Get.height*0.055,


                        buttonRadius: BorderRadius.circular(10),

                        buttonName: "Cancel", buttonColor: AppColor.greyColor, textColor: AppColor.white, onTap: (){
                      Get.back();

                    }),
                  ),
                  SizedBox(width: Get.width*0.03,),
                  Expanded(
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonHeight: Get.height*0.055,

                        buttonRadius: BorderRadius.circular(10),
                        buttonName: "Save", buttonColor: AppColor.btnColor, textColor: AppColor.whiteColor, onTap: onTap),
                  ),
                ],
              )
            ],
          ),
        ),

      ));
  return clean;
}









Future<bool> typeAlert({TextEditingController?controller,TextEditingController?controller1,hint="",subHint="",hint1="",subHint1="",onTap}) async {
  HapticFeedback.lightImpact();
  bool clean = false;
  await Get.generalDialog(

      pageBuilder: (context, __, ___) => AlertDialog(

        content: SizedBox(
          height: Get.height*0.28,
          child: Column(
            children: [
              textAuth(text: hint1,
                  textColor:Colors.black
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              sabenzaField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  }
                  if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                    return null;
                  }
                  return null;
                },
                hint:hint,
                hintColor: AppColor.primaryColor.withOpacity(0.8),
                textColor: AppColor.primaryColor.withOpacity(0.8),
                controller: controller,
              ),
              SizedBox(height: Get.height*0.025,),
              textAuth(text: subHint,
                  textColor:Colors.black
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              sabenzaField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  }
                  if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                    return null;
                  }
                  return null;
                },
                hint:subHint,
                hintColor: AppColor.primaryColor.withOpacity(0.8),
                textColor: AppColor.primaryColor.withOpacity(0.8),
                controller: controller1,
              ),
              SizedBox(height: Get.height*0.025,),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonHeight: Get.height*0.055,


                        buttonRadius: BorderRadius.circular(10),

                        buttonName: "Cancel", buttonColor: AppColor.greyColor, textColor: AppColor.white, onTap: (){
                      Get.back();

                    }),
                  ),
                  SizedBox(width: Get.width*0.03,),
                  Expanded(
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonHeight: Get.height*0.055,

                        buttonRadius: BorderRadius.circular(10),
                        buttonName: "Save", buttonColor: AppColor.btnColor, textColor: AppColor.whiteColor, onTap: onTap),
                  ),
                ],
              )
            ],
          ),
        ),

      ));
  return clean;
}

Future<bool> addOrdersAdminDialg({TextEditingController?controller,hint="",hint1="",onTap,String? text}) async {
  HapticFeedback.lightImpact();
  bool clean = false;
  await Get.generalDialog(

      pageBuilder: (context, __, ___) => AlertDialog(

        content: SizedBox(
          height: Get.height*0.23,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: text??"PACKAGE UPGRADE",
                size: AppSizes.size_16,
                fontWeight: FontWeight.w600,
                fontFamily: AppFont.medium,
                color: AppColor.black.withOpacity(0.8),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              textAuth(text: hint1,
                  textColor:Colors.black
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              sabenzaField(

                hint:hint,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.phone,
                hintColor: AppColor.primaryColor.withOpacity(0.8),
                textColor: AppColor.primaryColor.withOpacity(0.8),
                controller: controller,
              ),
              SizedBox(height: Get.height*0.025,),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonHeight: Get.height*0.055,


                        buttonRadius: BorderRadius.circular(10),

                        buttonName: "Cancel", buttonColor: AppColor.greyColor, textColor: AppColor.white, onTap: (){
                      Get.back();

                    }),
                  ),
                  SizedBox(width: Get.width*0.03,),
                  Expanded(
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonHeight: Get.height*0.055,

                        buttonRadius: BorderRadius.circular(10),
                        buttonName: "Update", buttonColor: AppColor.btnColor, textColor: AppColor.whiteColor, onTap: onTap),
                  ),
                ],
              )
            ],
          ),
        ),

      ));
  return clean;
}