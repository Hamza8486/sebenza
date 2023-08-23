import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/login.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';


class AccountType extends StatefulWidget {
  AccountType({Key? key}) : super(key: key);

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  final authController = Get.put(AuthController());

  String type="user";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
            right: Get.width * 0.04,left: Get.width * 0.04, top: Get.height * 0.08, bottom: Get.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: Get.height * 0.057,
                )),
            Column(

              children: [

                AppText(
                    title: "Account Type",
                    color: AppColor.whiteColor.withOpacity(0.7),
                    fontFamily: AppFont.semi,
                    size: AppSizes.size_20),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppText(
                    title: "Please choose your account type",
                    color: AppColor.greyColor,
                    textAlign: TextAlign.center,
                    fontFamily: AppFont.regular,
                    size: AppSizes.size_12),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            type="user";
                          });

                        },
                        child: typeWidget(
                          text: "For User",
                          image: "assets/images/user.svg",
                          color:type == "user"
                              ? AppColor.btnColor
                              : AppColor.whiteColor,
                          color1: type == "user"
                              ? AppColor.btnColor
                              : AppColor.whiteColor,
                          textColor:type == "user"
                              ? AppColor.whiteColor
                              : AppColor.greyColors,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      AppText(
                          title: "OR",
                          color: AppColor.whiteColor,
                          fontFamily: AppFont.medium,
                          size: AppSizes.size_15),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              type="admin";
                            });
                          },
                          child: typeWidget(
                              text: "For Admin",
                              image: "assets/images/home.svg",
                              color:type == "admin"
                                  ? AppColor.btnColor
                                  : AppColor.whiteColor,
                              color1: type == "admin"
                                  ? AppColor.btnColor
                                  : AppColor.whiteColor,
                              textColor:type == "admin"
                                  ? AppColor.whiteColor
                                  : AppColor.greyColors,
                              imageColor: type == "admin"
                                  ? AppColor.blackColor
                                  : null
                          )),
                    ],
                  ),
                )
              ],
            ),
            AppButton(
                buttonWidth: Get.width,
                buttonRadius: BorderRadius.circular(10),
                buttonName:  "Next",
                fontWeight: FontWeight.w500,
                textSize: AppSizes.size_15,
                buttonColor: AppColor.btnColor,
                textColor: AppColor.whiteColor,
                onTap:  () {
                  Get.to(
                      LoginView(type: type,),
                      transition: Transition.rightToLeft
                  );
                })
          ],
        ),
      )
    );
  }
}
Widget typeWidget({
  image,
  text,
  color,
  color1,
  Color?textColor,
  Color?imageColor
}) {
  return Material(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(10),

    ),
    elevation: 2,
    color: color1,
    child: SizedBox(
      height: Get.height*0.13,
      width: Get.height*0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            color: imageColor,
            height: Get.height * 0.042,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          AppText(
              title: text,
              color: textColor??AppColor.greyColors,
              fontFamily: AppFont.medium,
              size: AppSizes.size_13),
        ],
      ),
    ),
  );
}