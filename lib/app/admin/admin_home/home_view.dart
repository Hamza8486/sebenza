
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/component/home_component.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_invoice/view/admin_invoice_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_orders/view/orders_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/annoucement/view/announce_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/profile/profile_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/promo_codes/view/promo_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/roles/view/roles_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/setting/view/basic_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/view/tickets_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/view/user_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user_type/view/type_view.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/whats_pp/view/view.dart';
import 'package:sebenza/app/authentication/account_type.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';
import 'package:sebenza/app/widgets/image_pick.dart';


class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => showExitPopupMain(context,
            () async {
          setState(() {
            Get.delete<HomeController>();

            HelperFunctions().clearPrefs();
            Get.offAll(AccountType());
          });


        },
      ),
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

                      GestureDetector(
                        onTap:(){
                          homeController.getAdminProfile();
                          Get.to(ProfileView(),
                          transition: Transition.rightToLeft
                          );
                        },
                        child: Container(
                          height: Get.size.height * 0.065,
                          width: Get.size.height * 0.065,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(
                                  color: AppColor.whiteColor, width: 1.5)),
                          child: Obx(
                                  () {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: CachedNetworkImage(
                                      imageUrl: homeController.image.value,
                                      fit:
                                      homeController.image.value.isEmpty?BoxFit.cover:

                                      BoxFit.cover,
                                      placeholder: (context, url) =>  Center(
                                        child: SpinKitThreeBounce(
                                            size: 18, color: AppColor.btnColor),
                                      ),
                                      errorWidget: (context, url, error) => ClipRRect(
                                        borderRadius: BorderRadius.circular(1000),
                                        child: Image.asset(
                                          "assets/images/person.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ));
                              }
                          ),
                        ),
                      ),
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
                               return
                                 homeController.profileLoading.value?
                                 Center(
                                     child:
                                     SpinKitThreeBounce(size: 10, color: AppColor.white))
                                     :

                                 AppText(
                                   title:

                                   "${(homeController.adminProfileData?.user?.firstName).toString()} ${homeController.adminProfileData?.user?.lastName.toString()}",
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
                        showExitPopupMain(context,
                              () async {
                            setState(() {
                              Get.delete<HomeController>();

                              HelperFunctions().clearPrefs();
                              Get.offAll(AccountType());
                            });


                          },
                        );

                      },
                      child: Icon(Icons.login,color: AppColor.whiteColor,size: Get.height*0.03,))
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
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
                    padding: EdgeInsets.only(
                        left: Get.width * 0.06,right: Get.width * 0.06, top: Get.height * 0.02),
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
                                width: Get.width * 0.09,
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
                                width: Get.width * 0.09,
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
                                        homeController.clear();
                                        homeController.getTicketsData();
                                        Get.to(TicketsView());
                                      },
                                      child: WidgetDashboard(
                                          text: "Tickets",
                                          icon: Icon(Icons.email,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.profile))),
                              SizedBox(
                                width: Get.width * 0.09,
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
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.clear();
                                        homeController.getPromoData();
                                        Get.to(PromoView());
                                      },
                                      child: WidgetDashboard(
                                          text: "Promo Codes",
                                          icon: Icon(Icons.wallet_giftcard_sharp,color: AppColor.btnColor,
                                            size: Get.height*0.04,
                                          ),
                                          image: ImageAsset.profile))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),

                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        print("object");
                                        homeController.clear();
                                        homeController.getInvoiceData();
                                        Get.to(AdminInvoiceViews());

                                      },
                                      child: WidgetDashboard(
                                          text: "Invoices",
                                          icon: Icon(Icons.credit_card,color: AppColor.btnColor,
                                            size: Get.height*0.034,
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
                                        homeController.getOrderData();
                                        Get.to(AdminOrders());
                                      },
                                      child: WidgetDashboard(
                                          text: "Orders",
                                          icon: Icon(Icons.storefront,color: AppColor.btnColor,
                                            size: Get.height*0.034,
                                          ),
                                          image: ImageAsset.profile))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),

                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        print("object");


                                      },
                                      child:Container())),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.035,
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
