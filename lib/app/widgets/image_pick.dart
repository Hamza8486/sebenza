import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/login.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';




Widget bottomSheet({onCamera ,onGallery}) {
  return DraggableScrollableSheet(
    initialChildSize: 0.27,
    minChildSize: 0.27,
    maxChildSize: 0.27,
    builder: (_, controller) => Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(
                    onTap: onGallery,
                    child: iconCreation(
                        Icons.insert_photo, AppColor.primaryColor, "Gallery")),
                SizedBox(width: Get.width*0.2,),
                InkWell(
                    onTap: onCamera,
                    child: iconCreation(
                        Icons.camera_alt,AppColor.primaryColor , "Camera")),
              ],
            ),
          ],
        ),
      ),
    ),
  );


}

Widget iconCreation(IconData icons, Color color, String text) {
  return Column(
    children: [
      CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: Icon(
          icons,
          // semanticLabel: "Help",
          size: 22,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      AppText(
          title: text,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w500,
          size: 15)
    ],
  );
}
Future<bool> showExitPopupMain(context) async{

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: Get.height*0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Do you want to logout?".tr,style: TextStyle(color: AppColor.primaryColor,
                      fontFamily: AppFont.medium
                  ),),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await  Get.delete<HomeController>();
                          await  Get.delete<AuthController>();


                          await  HelperFunctions().clearPrefs();
                          Get.offAll(LoginView());

                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.primaryColor),
                        child:  Text("Yes".tr,style: TextStyle(color: AppColor.whiteColor),),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child:  Text("No".tr, style: TextStyle(color: Colors.black)),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      });}