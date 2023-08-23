import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/annoucement/component/component.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';
import 'package:sebenza/app/widgets/helper_function.dart';
import 'package:sebenza/app/widgets/image_pick.dart';

class AddAnn extends StatefulWidget {
  AddAnn({Key? key,this.data1,this.data}) : super(key: key);
  var data;
  var data1;

  @override
  State<AddAnn> createState() => _AddAnnState();
}

class _AddAnnState extends State<AddAnn> {
  final authController = Get.put(HomeController());
  List<String> types = [
    "Active",
    "Disable",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data=="update"?


    (
        authController.updateStatus1(widget.data1.status),

        authController.title.text=widget.data1.title,
        authController.des.text=widget.data1.description,

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
                              title: "Add Announcement",
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
                          textAuth(text: "Title"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                              if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                                return null;
                              }
                              return null;
                            },
                            hint: "title",
                            controller: authController.title,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Description"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                              if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                                return null;
                              }
                              return null;
                            },
                            max: 3,

                            hint: "description",

                            controller: authController.des,
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
                          Obx(() {
                            return dropDownButtons(
                                color2: AppColor.btnColor.withOpacity(0.4),
                                color1: authController.status1.value.isNotEmpty
                                    ? AppColor.btnColor.withOpacity(0.4)
                                    : AppColor.btnColor.withOpacity(0.4),
                                contentPadding: EdgeInsets.only(
                                    top: Get.height * 0.016,
                                    bottom: Get.height * 0.016,
                                    right: 10),
                                color: AppColor.btnColor.withOpacity(0.4),
                                hinText: "Select Status",
                                value: authController.status1.value.isEmpty
                                    ? null
                                    : authController.status1.value,
                                items: types.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  authController.updateStatus1(val.toString());
                                });
                          }),

                        ],
                      ):SizedBox.shrink(),

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Choose File"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          UploadMenu(text: "Choose",)


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
                        onTap: widget.data=="update"?(){
                          if(validateAnn(context)){
                            authController.updateAllLoader(true);
                            ApiManger().UpdateResponse(context: context,
                                id: widget.data1.id.toString(),
                              slug: widget.data1.slug.toString()
                            );

                          }
                        }:
                            () {
                          if(validateAnn(context)){
                            authController.updateAllLoader(true);
                            ApiManger().addUpdateResponse(context: context);

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
          return authController.loaderUpdatesUser.value == false
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
    if (Get.put(HomeController()).title.text.isEmpty) {
      flutterToast(msg: "Please enter title name");
      return false;
    }
    if (Get.put(HomeController()).des.text.isEmpty) {
      flutterToast(msg: "Please enter description");
      return false;
    }
    // if (Get.put(HomeController()).status1.value.isEmpty) {
    //   flutterToast(msg: "Please select status");
    //   return false;
    // }

    return true;



  }
}

