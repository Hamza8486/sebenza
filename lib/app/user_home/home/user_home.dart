
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/authentication/account_type.dart';
import 'package:sebenza/app/user_home/home/component/user_component.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/user_home/home/user_tabs/announcement/view/user_update.dart';
import 'package:sebenza/app/user_home/home/user_tabs/calendar/view/calendar_view.dart';
import 'package:sebenza/app/user_home/home/user_tabs/expense/expense_view.dart';
import 'package:sebenza/app/user_home/home/user_tabs/invoice/view/invoice_view.dart';
import 'package:sebenza/app/user_home/home/user_tabs/meeting/view/meeting_view.dart';
import 'package:sebenza/app/user_home/home/user_tabs/my_task/my_task.dart';
import 'package:sebenza/app/user_home/home/user_tabs/orders/view/orders_view.dart';
import 'package:sebenza/app/user_home/home/user_tabs/ticket_systtem/view/user_tickets.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';
import 'package:sebenza/app/widgets/image_pick.dart';


class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final homeController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => showExitPopupUser(context,
            () async {
          setState(() {
            Get.delete<UserController>();

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
                        showExitPopupUser(context,
                              () async {
                         setState(() {
                             Get.delete<UserController>();

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
                title: "User Dashboard",
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
                                            size: Get.height*0.034,
                                          ),
                                          image: ImageAsset.dashboard))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.getMeetingData();
                                        Get.to(MeetingView(),
                                        transition: Transition.rightToLeft
                                        );


                                      },
                                      child: WidgetDashboard(
                                          text: "Meetings",
                                          icon: Icon(Icons.email_outlined,color: AppColor.btnColor,
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
                                        homeController.getTaskData();
                                        Get.to(MyTaskView(),
                                            transition: Transition.rightToLeft
                                        );
                                      },
                                      child: WidgetDashboard(
                                          text: "My Task",
                                          icon: Icon(Icons.storage_rounded,color: AppColor.btnColor,
                                            size: Get.height*0.034,
                                          ),
                                          image: ImageAsset.dashboard))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.getCalendarData();
                                        Get.to(CalendarView(),
                                            transition: Transition.rightToLeft
                                        );

                                      },
                                      child: WidgetDashboard(
                                          text: "My Calendar",
                                          icon: Icon(Icons.calendar_today_sharp,color: AppColor.btnColor,
                                            size: Get.height*0.033,
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
                                        homeController.getExpenseData();
                                        Get.to(ExpenseView(),
                                            transition: Transition.rightToLeft
                                        );

                                      },
                                      child: WidgetDashboard(
                                          text: "My Finances",
                                          icon: Icon(Icons.follow_the_signs_rounded,color: AppColor.btnColor,
                                            size: Get.height*0.034,
                                          ),
                                          image: ImageAsset.dashboard))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        homeController.getAnnounceData();
                                        Get.to(UserAnnouncementView(),
                                            transition: Transition.rightToLeft
                                        );


                                      },
                                      child: WidgetDashboard(
                                          text: "Announcement",
                                          icon: Icon(Icons.notification_important_rounded,color: AppColor.btnColor,
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
                                        homeController.getOrderData();

                                        Get.to(UserOrders(),
                                            transition: Transition.rightToLeft
                                        );
                                      },
                                      child: WidgetDashboard(
                                          text: "My Orders",
                                          icon: Icon(Icons.storefront,color: AppColor.btnColor,
                                            size: Get.height*0.034,
                                          ),
                                          image: ImageAsset.dashboard))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        print("object");
                                        homeController.getInvoiceData();
                                        Get.to(InvoiceViews(),
                                            transition: Transition.rightToLeft
                                        );


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
                                        homeController.getTicketsData();

                                        Get.to(UserTickets(),
                                            transition: Transition.rightToLeft
                                        );

                                      },
                                      child: WidgetDashboard(
                                          text: "Tickets System",
                                          icon: Icon(Icons.email_outlined,color: AppColor.btnColor,
                                            size: Get.height*0.034,
                                          ),
                                          image: ImageAsset.dashboard))),
                              SizedBox(
                                width: Get.width * 0.09,
                              ),
                              Expanded(
                                  child: Container()),
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
