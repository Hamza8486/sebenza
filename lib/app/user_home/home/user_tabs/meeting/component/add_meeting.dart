import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';


class AddMeeting extends StatefulWidget {
  AddMeeting({Key? key,this.data,this.data1}) : super(key: key);

  var data;
  var data1;


  @override
  State<AddMeeting> createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  final homeController = Get.put(UserController());

  String ?platform;
  String ?status;
  List<String> types = [
    "Zoom",
    "Google Meet",
    "Skype",
    "Teams",
  ];
  List<String> statusList = [
    "Pending",
    "Done",
    "Cancel",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data=="update"?


    (
        homeController.link.text=
            widget.data1.link==null?"":
            widget.data1.link.toString(),
        homeController.time.text=
        widget.data1.time==null?"":
        widget.data1.time.toString(),
        homeController.date.text=
        widget.data1.date==null?"":
        widget.data1.date.toString(),
        homeController.des.text=
    widget.data1.description==null?"":
    widget.data1.description.toString(),


        homeController.title.text=
    widget.data1.title==null?"":
    widget.data1.title.toString(),
        platform=
    widget.data1.place==null?null:
    widget.data1.place.toString(),
    status=
    widget.data1.status==null?null:
    widget.data1.status.toString(),



    ):null;
  }

  @override
  Widget build(BuildContext context) {

    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.secColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: AppColor.primaryColor,
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
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color:AppColor.white,
                                  )),
                            ),

                            AppText(
                              title:
                              widget.data=="update"?"Update Meeting":
                             "Add A Meeting",
                              color: AppColor.white,
                              size: AppSizes.size_17,
                              fontFamily: AppFont.medium,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: Get.height * 0.042,
                                width: Get.height * 0.042,
                                decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Get.height * 0.1))),
                                child: Icon(
                                  Icons.add,
                                  color: AppColor.primaryColor,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Meeting Title"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            hint: "Title",
                            controller: homeController.title,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Platform"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                           dropDownButtons(
                                color2: AppColor.btnColor.withOpacity(0.4),
                                color1: AppColor.btnColor.withOpacity(0.4),
                                contentPadding: EdgeInsets.only(
                                    top: Get.height * 0.016,
                                    bottom: Get.height * 0.016,
                                    right: 10),
                                color: AppColor.btnColor.withOpacity(0.4),
                                hinText: "Select Platform",
                                value: platform,
                                items: types.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    platform=val.toString();
                                  });
                                }),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Meeting Link"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            hint: "Link",
                            controller: homeController.link,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Meeting Description"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            hint: "Description",
                            controller: homeController.des,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Meeting Date"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            isRead: true,
                            cur: false,
                            onTap: ()async{
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialEntryMode: DatePickerEntryMode.calendarOnly,

                                  builder: (BuildContext? context,
                                      Widget? child) {
                                    return Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          width: 350.0,
                                          height: 500.0,
                                          child: Theme(
                                            data: ThemeData.light().copyWith(
                                              primaryColor:
                                              AppColor.blackColor,

                                              colorScheme: ColorScheme.light(
                                                primary:
                                                AppColor.blackColor,),
                                              buttonTheme: ButtonThemeData(
                                                  buttonColor:
                                                  AppColor.primaryColor),
                                            ),
                                            child: child!,
                                          ),
                                        ));
                                  },
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050));

                              if (pickedDate != null) {
                                homeController.date.text =
                                    DateFormat('yyyy-MM-dd')
                                        .format(pickedDate);
                              }
                            },


                            hint: "Meeting Date",

                            controller: homeController.date,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Meeting Time"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            isRead: true,
                            cur: false,
                            onTap: ()async{

                              final TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedTime != null) {
                                final String formattedTime =
                                    '${pickedTime.hour.toString().padLeft(2, '0')}:'
                                    '${pickedTime.minute.toString().padLeft(2, '0')}:00';
                                setState(() {
                                  Get.put(UserController()).time.text= '${pickedTime.hour.toString().padLeft(2, '0')}:'
                                      '${pickedTime.minute.toString().padLeft(2, '0')}:00';
                                });
                              }
                            },


                            hint: "Meeting Time",

                            controller: homeController.time,
                          ),
                          widget.data=="update"?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              textAuth(text: "Status"),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              dropDownButtons(
                                    color2: AppColor.btnColor.withOpacity(0.4),
                                    color1:AppColor.btnColor.withOpacity(0.4),
                                    contentPadding: EdgeInsets.only(
                                        top: Get.height * 0.016,
                                        bottom: Get.height * 0.016,
                                        right: 10),
                                    color: AppColor.btnColor.withOpacity(0.4),
                                    hinText: "Select Status",
                                    value: status,
                                    items: statusList.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        status=val.toString();
                                      });
                                    }),

                            ],
                          ):SizedBox.shrink(),




                        ],
                      ),
                    ),
                  )),
              isKeyBoard
                  ? SizedBox.shrink()
                  : Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                    child: AppButton(
                        buttonWidth: Get.width,
                        buttonRadius: BorderRadius.circular(10),
                        buttonName: "Save Meeting",
                        fontWeight: FontWeight.w500,
                        textSize: AppSizes.size_15,
                        buttonColor: AppColor.btnColor,
                        textColor: AppColor.whiteColor,
                        onTap:widget.data=="update"?(){
                          if(validateAnn(context)){
                            homeController.updateAllLoader(true);
                            ApiManger().UpdateMeeting(context: context,
                                id: widget.data1.id.toString(),
                                status: status.toString(),
                              platform: platform.toString()
                            );

                          }
                        }:
                            () {
                          if(validateAnn(context)){
                            homeController.updateAllLoader(true);

                            ApiManger().addMeetings(context: context,
                            platform: platform.toString()
                            );

                          }
                        }),
                  ),
                  SizedBox(
                    height: Get.height * 0.013,
                  ),
                ],
              )
            ],
          ),
        ),
        Obx(() {
          return homeController.meetingAllLoader.value == false
              ? SizedBox.shrink()
              : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.7),
            child:  Center(
                child: SpinKitThreeBounce(
                    size: 25, color: AppColor.white)
            ),
          );



        })

      ],
    );
  }

  bool validateAnn(BuildContext context) {
    if (Get.put(UserController()).time.text.isEmpty) {
      flutterToast(msg: "Please enter title name");
      return false;
    }
    if (platform==null) {
      flutterToast(msg: "Please select platform");
      return false;
    }
    if (Get.put(UserController()).des.text.isEmpty) {
      flutterToast(msg: "Please enter description");
      return false;
    }
    if (Get.put(UserController()).date.text.isEmpty) {
      flutterToast(msg: "Please enter date");
      return false;
    }
    if (Get.put(UserController()).time.text.isEmpty) {
      flutterToast(msg: "Please enter time");
      return false;
    }


    return true;



  }
}

