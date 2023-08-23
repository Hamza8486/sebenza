import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static const primaryColor = Color(0xff0c1428);
  static const secColor = Color(0xff070d19);
  static const textColor = Color(0xff7987a1);
  static const btnColor = Color(0xff6671ff);
  static const inActiveColor = Color(0xff172340);

  static const borderColorField = Color(0xFFC4C4C4);
  static Color tabsColor = const Color(0xffF7F7F7);
  static Color greyColors = const Color(0xff808080);

  static const whiteColor = Colors.white;
  static const lightAppColor2 = Color(0xFFBAD3FC);
  static const redLight = Color(0xFFFFDEE2);


  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);




  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
  static const lightRed = Color(0xFFFFCDCC);
  static const boxAppColor = Color(0xFFBAD3FC);
  static const blackColor = Color(0xFF000000);
  static const tabColor = Color(0xFF9DB2CE);
  static Color catBorderColors = const Color(0xffD8D1D1);
  static const boldBlackColor = Color(0xFF212121);
  static const headColor = Color(0xFFF0F0F0);
  static const pinColor = Color(0xFFF8F8FC);
  static const textGreyColor = Color(0xFF9099A8);
  static const boldGreyColor = Color(0xFF9A9A9A);
  static const greyColor = Colors.grey;
  static Color catColor = const Color(0xffF9F9FD);
  static const backgroundColor = Color.fromARGB(255, 243, 243, 243);
  static const transParent = Colors.transparent;

  static Color Color1 =  const Color(0xffDBFDDF);
  static Color Color2 =  const Color(0xff6BAE00);
  static Color Color3 =  const Color(0xffFFE6F3);
  static Color Color4 =  const Color(0xffFDF4DB);
  static Color Color5 =  const Color(0xffFFE8E0);
  static Color Color6 =  const Color(0xffF2E1FF);
  static Color Color7 =  const Color(0xffE1F4FF);
  static Color Color8 =  const Color(0xffFFDFDF);



}

class AppSizes {
  static double size_10 = Get.height / 81.2;
  static double size_11 = Get.height / 73.8;
  static double size_12 = Get.height / 67.7;
  static double size_13 = Get.height / 62.5;
  static double size_14 = Get.height / 58;
  static double size_15 = Get.height / 54.1;
  static double size_16 = Get.height / 50.8;
  static double size_17 = Get.height / 47.8;
  static double size_18 = Get.height / 45.1;
  static double size_19 = Get.height / 42.7;
  static double size_20 = Get.height / 40.6;
  static double size_21 = Get.height / 38.7;
  static double size_22 = Get.height / 36.9;
  static double size_23 = Get.height / 35.3;
  static double size_24 = Get.height / 33.8;
  static double size_25 = Get.height / 32.5;
  static double size_26 = Get.height / 31.2;
  static double size_27 = Get.height / 30.1;
  static double size_28 = Get.height / 29;
  static double size_29 = Get.height / 28;
  static double size_30 = Get.height / 27.1;
}




class AppPaddings {
  static EdgeInsets mainPadding = EdgeInsets.only(
      right: Get.width * 0.04,left: Get.width * 0.04, top: Get.height * 0.025, bottom: Get.height * 0.01);


  static EdgeInsets mainHomePadding = EdgeInsets.only(
      left: Get.width * 0.04,right: Get.width * 0.04, top: Get.height * 0.02);
  static EdgeInsets mainHorizontal = EdgeInsets.symmetric(
      horizontal: Get.width * 0.04);
  static EdgeInsets mainVertical = EdgeInsets.symmetric(
      vertical: Get.height * 0.025);
}

void showLoadingIndicator({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          height: 65,width: 65,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),     color: Colors.white,),
          child: Container(

            height: 25,width: 25,color: Colors.transparent,child:  const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black26,
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColor.primaryColor //<-- SEE HERE

              ),
                // strokeWidth: 5,
          ),
            ),),
        ),
      );
    },
  );
}
class AppFont {
  static String regular = "regular";
  static String medium = "medium";
  static String bold = "bold";
  static String semi = "semi";

}
class ImageAsset {
  static const _path = "assets/images";
  static const splash = "$_path/splash.png";
  static const attend = "$_path/attendence.svg";
  static const calendar = "$_path/calendar.svg";
  static const dashboard = "$_path/dasboard.svg";
  static const logo = "$_path/logo.svg";
  static const menu = "$_path/menu.svg";
  static const arrow = "$_path/arrow.svg";
  static const profile = "$_path/profile.svg";
  static const search = "$_path/search.svg";
  static const search1 = "$_path/search1.svg";
  static const noti = "$_path/noti.svg";
  static const training = "$_path/training.svg";
  static const edit = "$_path/edit.svg";
  static const time = "$_path/time.svg";
  static const dot = "$_path/dot.svg";
  static const user = "$_path/user.png";
  static const splash1 = "$_path/splash1.png";
  static const splash2 = "$_path/splash3.png";


  // icons

  static const _pathIcons = "assets/icons";
  static const edits = "$_pathIcons/edits.svg";
  static const del = "$_pathIcons/del.svg";
  static const cal = "$_pathIcons/cal.svg";
  static const timeCircle = "$_pathIcons/time.svg";
  static const profileUser = "$_pathIcons/profile.svg";
  static const pin = "$_pathIcons/pin.svg";
  static const doc = "$_pathIcons/doc.svg";
  static const id = "$_pathIcons/id.svg";
  static const lock = "$_pathIcons/lock.svg";
  static const info = "$_pathIcons/info.svg";
  static const notif = "$_pathIcons/noti.svg";
  static const payment = "$_pathIcons/payment.svg";
  static const setting = "$_pathIcons/setting.svg";
  static const arrowRight = "$_pathIcons/arrow.svg";
  static const logOut = "$_pathIcons/logOut.svg";
  static const paid = "$_pathIcons/paid.svg";
  static const approve = "$_pathIcons/approve.svg";
  static const cancel = "$_pathIcons/cancel.svg";
  static const available = "$_pathIcons/available.svg";
  static const trueIcon = "$_pathIcons/true.svg";
  static const cross = "$_pathIcons/cross.svg";
  static const down = "$_pathIcons/down.svg";
  static const search0 = "$_pathIcons/Search.svg";
  static const leaves = "$_pathIcons/leaves.svg";
  static const pay = "$_pathIcons/payroll.svg";
  static const pins = "$_pathIcons/pins.svg";
  static const camera = "$_pathIcons/camera.svg";
  static const colon = "$_pathIcons/colon.svg";
  static const Times = "$_pathIcons/Times.svg";
  static const loc = "$_pathIcons/loc.svg";
  static const bag = "$_pathIcons/bag.svg";
  static const calendars = "$_pathIcons/Calendar.svg";
  static const target = "$_pathIcons/target.svg";
  static const achive = "$_pathIcons/achive.svg";
}