
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/component/home_component.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/annoucement/view/announce_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/roles/view/roles_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/setting/view/basic_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/view/user_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user_type/view/type_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/whats_pp/view/view.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/image_pick.dart';


class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => showExitPopupMain(context),
      child: Scaffold(
        backgroundColor: AppColor.secColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.065,
            ),
            Padding(
              padding: AppPaddings.mainHorizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(

                    children: [


                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Welcome Back!",
                            size: AppSizes.size_14,
                            fontFamily: AppFont.medium,
                            color: AppColor.whiteColor.withOpacity(0.8),
                          ),

                          SizedBox(
                            height: Get.height * 0.002,
                          ),
                           Obx(
                             () {
                               return AppText(
                                      title:

                                      "${homeController.name.value.toString()} ${homeController.nameLast.value.toString()}",
                                      size: AppSizes.size_15,
                                      overFlow: TextOverflow.ellipsis,
                                      maxLines:
                                      homeController.name.value.isNotEmpty?1:
                                      1,
                                      fontFamily: AppFont.medium,
                                 color: AppColor.whiteColor.withOpacity(0.8),
                                    );
                             }
                           ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: (){
                        showExitPopupMain(context);
                      },
                      child: Icon(Icons.login,color: AppColor.whiteColor,size: Get.height*0.03,))
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.09),
              child: AppText(
                title: "Admin Dashboard",
                size: AppSizes.size_17,
                fontFamily: AppFont.semi,
                color: AppColor.whiteColor.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Expanded(
                child: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: AppColor.secColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: AppPaddings.mainHomePadding,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {

                                      },
                                      child: WidgetDashboard(
                                          text: "Dashboard",
                                          icon: Icon(Icons.dashboard,color: AppColor.btnColor,
                                          size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.dashboard))),
                              SizedBox(
                                width: Get.width * 0.07,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getUserData(search: "");
                                        Get.to(UserView(),
                                        transition: Transition.rightToLeft
                                        );

                                      },
                                      child: WidgetDashboard(
                                          text: "User",
                                          icon: Icon(Icons.group,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.calendar))),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getUserRolesData(id: "");
                                        Get.to(RolesView(),
                                            transition: Transition.rightToLeft
                                        );
                                      },
                                      child: WidgetDashboard(
                                          text: "Roles",
                                          icon: Icon(Icons.person_add_alt_1,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),

                                          image: ImageAsset.pay))),
                              SizedBox(
                                width: Get.width * 0.07,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getAccountData(search: "");
                                        Get.to(TypeView(),
                                            transition: Transition.rightToLeft
                                        );
                                      },
                                      child: WidgetDashboard(
                                          icon: Icon(Icons.verified_user,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          text: "Account Type", image: ImageAsset.pay))),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getUpdatesData();
                                        Get.to(AnnouncementView());

                                      },
                                      child: WidgetDashboard(
                                          text: "Announcement",
                                          icon: Icon(Icons.notification_important_rounded,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.profile))),
                              SizedBox(
                                width: Get.width * 0.07,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getBasicData();
                                        Get.to(BasicSettingView());
                                      },
                                      child: WidgetDashboard(
                                          text: "Basic Settings",
                                          icon: Icon(Icons.settings,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.leaves))),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {

                                      },
                                      child: WidgetDashboard(
                                          text: "Tickets",
                                          icon: Icon(Icons.email,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.profile))),
                              SizedBox(
                                width: Get.width * 0.07,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getWhatsaData(search: "");
                                        Get.to(WhatsappView());
                                      },
                                      child: WidgetDashboard(
                                          text: "Whatsapp",
                                          icon: Icon(Icons.message,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.leaves))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
