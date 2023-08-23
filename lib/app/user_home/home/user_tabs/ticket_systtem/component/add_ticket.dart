import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';


class AddTickets extends StatefulWidget {
  AddTickets({Key? key}) : super(key: key);


  @override
  State<AddTickets> createState() => _AddTicketsState();
}

class _AddTicketsState extends State<AddTickets> {
  final userController = Get.put(UserController());

  String? department;
  String? priority;
  List<String> typesDepartment = [
    "Accounts",
    "Support Team",
    "Sales Team",
  ];
  List<String> typesPriority = [
    "High",
    "Medium",
    "Low",
  ];




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
                              "Add New Ticket",
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
                          textAuth(text: "Subject"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(

                            hint: "Name",
                            controller: userController.subject,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Department"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                      dropDownButtons(
                          color2: AppColor.btnColor.withOpacity(0.4),
                          color1:  AppColor.btnColor.withOpacity(0.4),
                          contentPadding: EdgeInsets.only(
                              top: Get.height * 0.016,
                              bottom: Get.height * 0.016,
                              right: 10),
                          color: AppColor.btnColor.withOpacity(0.4),
                          hinText: "Select department",
                          value: department,
                          items: typesDepartment.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              department=val.toString();
                            });
                          }),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Priority"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          dropDownButtons(
                              color2: AppColor.btnColor.withOpacity(0.4),
                              color1:  AppColor.btnColor.withOpacity(0.4),
                              contentPadding: EdgeInsets.only(
                                  top: Get.height * 0.016,
                                  bottom: Get.height * 0.016,
                                  right: 10),
                              color: AppColor.btnColor.withOpacity(0.4),
                              hinText: "Select priority",
                              value: priority,
                              items: typesPriority.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  priority=val.toString();
                                });
                              }),

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Ticket Details"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(

                            hint: "Ticket Details",
                            controller: userController.ticketDes,
                            max: 3,
                            textInputAction: TextInputAction.done
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Choose File"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          TicketFile(text: "Choose",)


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
                        onTap:
                            () {
                          if(validateAnn(context)){

                            userController.updateAddTicketLoader(true);
                            ApiManger().addTicket(context: context,
                            dep: department.toString(),
                              pir: priority.toString()
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
          return userController.addTicketLoader.value == false
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
    if (Get.put(UserController()).subject.text.isEmpty) {
      flutterToast(msg: "Please enter subject name");
      return false;
    }
    if (department==null) {
      flutterToast(msg: "Please select department");
      return false;
    }
    if (priority==null) {
      flutterToast(msg: "Please select priority");
      return false;
    }

    if (Get.put(UserController()).ticketDes.text.isEmpty) {
      flutterToast(msg: "Please enter description");
      return false;
    }





    return true;



  }

  List<DropdownMenuItem<int>> countryDataList({var dataList}) {
    List<DropdownMenuItem<int>> outputList = [];
    for (int i = 0; i < dataList.length; i++) {
      outputList.add(DropdownMenuItem<int>(
          value: dataList[i].id,
          child: AppText(
            title: dataList[i].expenceType,
            size: AppSizes.size_15,
            color: AppColor.white.withOpacity(0.8),
            fontFamily: AppFont.regular,
            fontWeight: FontWeight.w500,
          )));
    }
    return outputList;
  }
}

class TicketFile extends StatefulWidget {
   TicketFile({Key? key,this.text}) : super(key: key);
  var text;

  @override
  State<TicketFile> createState() => _TicketFileState();
}

class _TicketFileState extends State<TicketFile> {
  final homeController = Get.put(UserController());

  void pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png','pdf','doc'],

    ).then((value) {
      if(value!= null )
      {
        homeController.fileTicket = File(value.paths.first!
        );
        setState(() {

        });
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap:
          pickImage,
          child: Container(
              height: Get.height * 0.047,
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(7)),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: AppText(
                    title: widget.text,
                    color: AppColor.whiteColor.withOpacity(0.8),
                    size: AppSizes.size_11,
                    fontFamily: AppFont.medium,
                  ),
                ),
              )


          ),
        ),
        homeController.fileTicket == null?Container():
        SizedBox(
          height: Get.height * 0.01,
        ),
        homeController.fileTicket == null?Container():
        GestureDetector(
          onTap: (){
            homeController.fileTicket = null;
          },
          child: AppText(
            title:  homeController.fileTicket?.path.split('/file_picker/').last??"",
            color: AppColor.white,
            size: AppSizes.size_12,
            fontFamily: AppFont.semi,
          ),
        ),
      ],
    );
  }
}
