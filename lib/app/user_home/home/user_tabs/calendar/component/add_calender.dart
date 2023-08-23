import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';


class AddCalendar extends StatefulWidget {
  AddCalendar({Key? key,this.data,this.data1}) : super(key: key);

  var data;
  var data1;





  @override
  State<AddCalendar> createState() => _AddCalendarState();
}

class _AddCalendarState extends State<AddCalendar> {
  final homeController = Get.put(UserController());
// ValueChanged<Color> callback
  void changeFirstColor(Color color) {
    setState(() => firstColor = color);
  }
  String ?status;
  List<String> statusList = [
    "Pending",
    "Done",
    "Cancel",
  ];
  String? colorHexCode = '#000000';
  Color firstColor = Color(0xff0d4430);
  Color currentColor = Color(0xff0d4430);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data=="update"?


    (
        homeController.eventName.text=
        widget.data1.title==null?"":
        widget.data1.title.toString(),
        homeController.eventDetail.text=
        widget.data1.details==null?"":
    widget.data1.details.toString(),
    homeController.eventStart.text=
    widget.data1.startDate==null?"":
    widget.data1.startDate.toString(),
    homeController.eventEnd.text=
    widget.data1.endDate==null?"":
    widget.data1.endDate.toString(),

    homeController.eventTime.text=
    widget.data1.startTime==null?"":
    widget.data1.startTime.toString(),


    homeController.eventTimeEnd.text=
    widget.data1.endTime==null?"":
    widget.data1.endTime.toString(),
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

                              "Add New Event",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Event Name"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            hint: "Title",
                            controller: homeController.eventName,
                          ),


                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Event Details"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            hint: "Event Details",
                            max: 3,
                            controller: homeController.eventDetail,
                          ),

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                         Row(
                           children: [
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   textAuth(text: "Start Date"),
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
                                         homeController.eventStart.text =
                                             DateFormat('yyyy-MM-dd')
                                                 .format(pickedDate);
                                       }
                                     },


                                     hint: "Start Date",

                                     controller: homeController.eventStart,
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: Get.width*0.04,),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   textAuth(text: "End Date"),
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
                                         homeController.eventEnd.text =
                                             DateFormat('yyyy-MM-dd')
                                                 .format(pickedDate);
                                       }
                                     },


                                     hint: "End Date",

                                     controller: homeController.eventEnd,
                                   ),
                                 ],
                               ),
                             )
                           ],
                         ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                         Row(
                           children: [
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   textAuth(text: "Start Time"),
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
                                           Get.put(UserController()).eventTime.text= '${pickedTime.hour.toString().padLeft(2, '0')}:'
                                               '${pickedTime.minute.toString().padLeft(2, '0')}:00';
                                         });
                                       }
                                     },


                                     hint: "Start Time",

                                     controller: homeController.eventTime,
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: Get.width*0.034,),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   textAuth(text: "End Time"),
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
                                           Get.put(UserController()).eventTimeEnd.text= '${pickedTime.hour.toString().padLeft(2, '0')}:'
                                               '${pickedTime.minute.toString().padLeft(2, '0')}:00';
                                         });
                                       }
                                     },


                                     hint: "End Time",

                                     controller: homeController.eventTimeEnd,
                                   ),
                                 ],
                               ),
                             )

                           ],
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

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Background Color"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              print('color pressed');
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Pick a color!'),
                                    content:
                                    SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: firstColor,
                                        onColorChanged:(Color color){
                                          setState(() {
                                            firstColor = color;
                                            currentColor =
                                                color;
                                            colorHexCode =
                                            color.value.toRadixString(16).substring(2, 8);
                                          });
                                        },
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text(
                                            'Got it'),
                                        onPressed: () {
                                          setState(() =>
                                          currentColor =
                                              firstColor);
                                          print(currentColor);
                                          colorHexCode =
                                          '${currentColor.value.toRadixString(16).substring(2, 8)}';
                                          print(
                                              'actual Code ${colorHexCode}');
                                          Navigator.of(context)
                                              .pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: currentColor,),

                                child:  Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.06,vertical: 12),
                                  child: AppText(
                                    title: colorHexCode.toString(),
                                    size: AppSizes.size_14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFont.regular,
                                    color: AppColor.white.withOpacity(0.8),
                                  ),
                                ) ,

                              )
                            ),
                          ),





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
                        buttonName: "Save",
                        fontWeight: FontWeight.w500,
                        textSize: AppSizes.size_15,
                        buttonColor: AppColor.btnColor,
                        textColor: AppColor.whiteColor,
                        onTap:widget.data=="update"?(){
                          if(validateAnn(context)){
                            homeController.updateAddCalLoader(true);
                            ApiManger().updateCalendar(context: context,color:"#${colorHexCode.toString()
                                }",
                            id: widget.data1.id.toString(),
                              status: status.toString()
                            );

                          }
                        }:
                            () {
                          if(validateAnn(context)){
                            homeController.updateAddCalLoader(true);
                            ApiManger().addCalendarResp(context: context,color:"#${colorHexCode.toString()}");


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
          return homeController.addCalLoader.value == false
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
    if (Get.put(UserController()).eventName.text.isEmpty) {
      flutterToast(msg: "Please enter title name");
      return false;
    }

    if (Get.put(UserController()).eventDetail.text.isEmpty) {
      flutterToast(msg: "Please enter event detail");
      return false;
    }
    if (Get.put(UserController()).eventStart.text.isEmpty) {
      flutterToast(msg: "Please enter start date");
      return false;
    }
    if (Get.put(UserController()).eventEnd.text.isEmpty) {
      flutterToast(msg: "Please enter end date");
      return false;
    }
    if (Get.put(UserController()).eventTime.text.isEmpty) {
      flutterToast(msg: "Please enter start time");
      return false;
    }
    if (Get.put(UserController()).eventTimeEnd.text.isEmpty) {
      flutterToast(msg: "Please enter end time");
      return false;
    }


    return true;



  }
}

