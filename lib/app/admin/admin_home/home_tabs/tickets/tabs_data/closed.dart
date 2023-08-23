import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/component/chat_detail.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';

class Closed extends StatelessWidget {
  Closed({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return     Obx(
            () {
          return
            homeController.allTicketList.where((p0) => p0.status =="Closed").toList().isNotEmpty?


            ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount:homeController.allTicketList.where((p0) => p0.status =="Closed").toList().length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      homeController.ticketDetailList.clear();
                      homeController.updateIdData(homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index].id.toString());
                      homeController.getTicketDetailData(id:homeController.updateId.toString() );
                      Get.to(ChatDetailView(data:homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index] ,
                       type: "Closed",
                      ));
                      print(homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index].id.toString());
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

                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                          placeholder: (context, url) =>  Center(
                                            child: SpinKitThreeBounce(
                                                size: 20,
                                                color: AppColor.primaryColor
                                            ),
                                          ),
                                          imageUrl: homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index].users?.profile??"",
                                          height: Get.height * 0.06,
                                          width: Get.height * 0.06,

                                          fit: BoxFit.cover,

                                          errorWidget: (context, url, error) => ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/person.png",
                                              height: Get.height * 0.06,
                                              width: Get.height * 0.06,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                      ),











                                    ),
                                    SizedBox(width: Get.width*0.03,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        textAuth2(text:homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index].users?.firstName??""),
                                        SizedBox(height: 2,),
                                        SizedBox(
                                          width: Get.width*0.45,
                                          child: AppText(
                                            title: homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index].message??"",
                                            size: AppSizes.size_12,
                                            maxLines: 1,
                                            overFlow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: AppFont.regular,
                                            color: AppColor.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                                AppText(
                                  title: homeController.allTicketList.where((p0) => p0.status =="Closed").toList()[index].createdAt??"",
                                  size: AppSizes.size_12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFont.regular,
                                  color: AppColor.white.withOpacity(0.5),
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
    );
  }
}
