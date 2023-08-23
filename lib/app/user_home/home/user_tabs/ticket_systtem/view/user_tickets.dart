
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/user_home/home/user_tabs/ticket_systtem/component/add_ticket.dart';
import 'package:sebenza/app/user_home/home/user_tabs/ticket_systtem/component/reply_tickets.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';




class UserTickets extends StatelessWidget {
  UserTickets({Key? key}) : super(key: key);

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
                                color:AppColor.white,
                              )),
                        ),
                        AppText(
                          title: "My Tickets",
                          color: AppColor.white,
                          size: AppSizes.size_17,
                          fontFamily: AppFont.medium,
                        ),
                        GestureDetector(
                          onTap: (){
                            homeController.clear();
                            Get.to(AddTickets());

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




          Expanded(
              child:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [


                      Obx(
                              () {
                            return
                              homeController.ticketLoader.value?loader():
                              homeController.ticketList.isNotEmpty?

                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount:homeController.ticketList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        homeController.ticketDetailList.clear();
                                        homeController.updateIdData(homeController.ticketList[index].id.toString());

                                        homeController.getTicketDetailData(id:homeController.updateId.toString() );
                                        Get.to(ReplyTicketsAll(data:homeController.ticketList[index],
                                          type: "Pending",
                                        ));
                                      },
                                      child: Card(
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
                                                      textAuth2(text:"From : "),

                                                      textAuth(text:homeController.ticketList[index].users?.firstName),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textAuth2(text:"Subject : "),

                                                      textAuth(text:homeController.ticketList[index].subject),
                                                    ],
                                                  ),


                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      textAuth2(text:"Department : "),

                                                      textAuth(text:homeController.ticketList[index].department),
                                                    ],
                                                  ),



                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),
                                              Row(

                                                children: [
                                                  textAuth2(text:"Priority : "),


                                                  Container(

                                                    decoration:BoxDecoration(color:
                                                    AppColor.btnColor,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                      child: AppText(
                                                        title: homeController.ticketList[index].priority.toString(),
                                                        size: AppSizes.size_14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: AppFont.regular,
                                                        color: AppColor.white.withOpacity(0.8),
                                                      ),
                                                    ),
                                                  ),


                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  textAuth2(text:"Updated at : "),

                                                  textAuth(text:homeController.ticketList[index].updatedAt),
                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  textAuth2(text:"Created at : "),

                                                  textAuth(text:homeController.ticketList[index].createdAt),
                                                ],
                                              ),
                                              homeController.ticketList[index].solvedBy==null?SizedBox.shrink():
                                              SizedBox(height: Get.height*0.015,),
                                              homeController.ticketList[index].solvedBy==null?SizedBox.shrink():
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  textAuth2(text:"Solved By : "),

                                                  textAuth(text:homeController.ticketList[index].solvedBy),
                                                ],
                                              ),
                                              SizedBox(height: Get.height*0.015,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,

                                                children: [



                                                  Container(

                                                    decoration:BoxDecoration(color:

                                                    homeController.ticketList[index].status=="Answered"?Colors.green:
                                                    homeController.ticketList[index].status=="Closed"?Colors.pinkAccent:
                                                    AppColor.btnColor,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                      child: AppText(
                                                        title: homeController.ticketList[index].status.toString(),
                                                        size: AppSizes.size_14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: AppFont.regular,
                                                        color: AppColor.white.withOpacity(0.8),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: Get.width*0.03,),
                                                  Container(

                                                    decoration:BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                      border: Border.all(color:  AppColor.btnColor,)

                                                    ),
                                                    child: Padding(
                                                      padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 5.5),
                                                      child: AppText(
                                                        title: "View",
                                                        size: AppSizes.size_14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: AppFont.regular,
                                                        color: AppColor.btnColor,
                                                      ),
                                                    ),
                                                  ),


                                                ],
                                              ),







                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }):noData();
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


}
