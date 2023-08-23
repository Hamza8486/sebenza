import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/app_textfield.dart';
import 'package:sebenza/app/widgets/drop_down.dart';


Widget textAuth({text,Color?color,Color?textColor}){
  return Row(
    children: [
      AppText(
        title: "$text",
        size: AppSizes.size_14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFont.regular,
        color:textColor?? AppColor.white.withOpacity(0.8),
      ),
      AppText(
        title: " *",
        size: AppSizes.size_13,
        fontWeight: FontWeight.w400,
        fontFamily: AppFont.regular,
        color: color??
        AppColor.boldBlackColor.withOpacity(0.8),
      ),
    ],
  );
}
Widget textAuth2({text,Color?color,Color?textColor}){
  return Row(
    children: [
      AppText(
        title: "$text",
        size: AppSizes.size_13,
        fontWeight: FontWeight.w600,
        fontFamily: AppFont.medium,
        color:textColor?? AppColor.white.withOpacity(0.9),
      ),
      AppText(
        title: " *",
        size: AppSizes.size_14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFont.regular,
        color: color??
            AppColor.boldBlackColor.withOpacity(0.8),
      ),
    ],
  );
}
Widget textAuth1({text,Color?color}){
  return Row(
    children: [
      AppText(
        title: "$text",
        size: AppSizes.size_14,
        fontWeight: FontWeight.w500,
        fontFamily: AppFont.medium,
        color: AppColor.white.withOpacity(0.8),
      ),
      AppText(
        title: " *",
        size: AppSizes.size_14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFont.regular,
        color: color??
            AppColor.boldBlackColor.withOpacity(0.8),
      ),
    ],
  );
}

Widget sabenzaField({String? Function(String?)? validator,TextEditingController?controller,
  String?hint="", TextInputType?textInputType,TextInputAction?textInputAction,
  bool obscure = false,
  bool isSuffix = false,
  Color?hintColor,
  Color?textColor,
  bool isRead=false,
  bool cur=true,
  int max=1,
  VoidCallback? onTap,
  Widget?child


}){
  return AppTextFied(
    isborderline: true,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    isborderline2: true,
    isShowCursor: cur,
    isReadOnly: isRead,
    validator: validator,
    textColor:
    textColor??
    AppColor.white.withOpacity(0.8),


    onTap:onTap ,
    obsecure: obscure,
    suffixIcon: child??SizedBox.shrink(),
    padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.03,
        vertical: Get.height * 0.016),
    borderRadius: BorderRadius.circular(10),
    borderRadius2: BorderRadius.circular(10),
    borderColor: AppColor.btnColor.withOpacity(0.4),
    hint: hint??"",
    hintColor:
    hintColor??
    AppColor.white.withOpacity(0.8),
    textInputType:
    textInputType??
    TextInputType.emailAddress,
    textInputAction:
    textInputAction??
    TextInputAction.next,
    hintSize: AppSizes.size_13,
    isSuffix:
    isSuffix?false:
    true,
    controller: controller,
    fontFamily: AppFont.regular,
    borderColor2: AppColor.btnColor,
    maxLines: max,
  );
}
Widget dropDownAppAdd({hint,onChange,items,value,width,Color?color,double ? height}){
  return SortedByDropDown(
      hint: hint,
      icon: SvgPicture.asset("assets/icons/downs.svg",height: Get.height*0.03,
      color: AppColor.btnColor,
      ),
      buttonDecoration: BoxDecoration(
        color: AppColor.transParent,
        border: Border.all(
            color:
            color??
                AppColor.btnColor.withOpacity(0.4), width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      fontSize: AppSizes.size_14,
      fontFamily: AppFont.regular,
      hintColor:AppColor.white.withOpacity(0.8),
      fontFamily1: AppFont.regular,
      fontSize1: AppSizes.size_13,
      dropdownItems: items,
      value: value,
      buttonHeight: Get.height * 0.058,
      dropdownHeight:height?? Get.height,
      dropdownWidth: width,
      buttonElevation: 0,
      onChanged: onChange
  );
}
Widget chooseOptionsAll({onTap,color,color1,color2,String?text}){
  return  GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            height: Get.height*0.021,
            width: Get.height*0.021,
            decoration: BoxDecoration(
                color: color,
                border: Border.all(color: color1),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(child: Icon(Icons.check,color: color2,
              size: Get.height*0.018,
            )),
          ),
          SizedBox(width: Get.width*0.02,),
          AppText(
              title:text?? "",
              color: AppColor.blackColor,
              fontFamily: AppFont.regular,
              size: AppSizes.size_14)
        ],
      ),
    ),
  );
}