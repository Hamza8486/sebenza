import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';

class AddWhatsapp extends StatefulWidget {
  AddWhatsapp({Key? key, this.data, this.data1}) : super(key: key);
  var data;
  var data1;

  @override
  State<AddWhatsapp> createState() => _AddWhatsappState();
}

class _AddWhatsappState extends State<AddWhatsapp> {
  final authController = Get.put(HomeController());
  List<String> types = [
    "Active",
    "Disable",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data == "update"
        ? (
            authController.accountName.text = widget.data1.userName,
            authController.whatsapp.text = widget.data1.whatsappNumber,
        authController.updateStatus2(widget.data1.status)
          )
        : null;
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
                                    color: AppColor.white,
                                  )),
                            ),
                            AppText(
                              title: widget.data == "update"
                                  ? "Update Whatsapp"
                                  : "Add New Whatsapp",
                              color: AppColor.white,
                              size: AppSizes.size_16,
                              fontFamily: AppFont.semi,
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
                      textAuth(text: "Account Name"),
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
                        hint: "Name",
                        controller: authController.accountName,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Whatsapp Number"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.phone,
                        hint: "Whatsapp Number",
                        controller: authController.whatsapp,
                      ),
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
                            color1: authController.status2.value.isNotEmpty
                                ? AppColor.btnColor.withOpacity(0.4)
                                : AppColor.btnColor.withOpacity(0.4),
                            contentPadding: EdgeInsets.only(
                                top: Get.height * 0.016,
                                bottom: Get.height * 0.016,
                                right: 10),
                            color: AppColor.btnColor.withOpacity(0.4),
                            hinText: "Select Status",
                            value: authController.status2.value.isEmpty
                                ? null
                                : authController.status2.value,
                            items: types.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (val) {
                              authController.updateStatus2(val.toString());
                            });
                      }),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03),
                          child: AppButton(
                              buttonWidth: Get.width,
                              buttonRadius: BorderRadius.circular(10),
                              buttonName: "Save",
                              fontWeight: FontWeight.w500,
                              textSize: AppSizes.size_15,
                              buttonColor: AppColor.btnColor,
                              textColor: AppColor.whiteColor,
                              onTap: widget.data == "update"
                                  ? () {
                                      if (validateRole(context)) {
                                        authController
                                            .updateUserTypeLoader(true);
                                        ApiManger().updateWhatsapp(
                                            context: context,
                                            id: widget.data1.id.toString());
                                      }
                                    }
                                  : () {
                                      if (validateRole(context)) {
                                        authController
                                            .updateUserTypeLoader(true);
                                        ApiManger()
                                            .addWhatsappType(context: context);
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
          return authController.loaderTypeUser.value == false
              ? SizedBox.shrink()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                      child:
                          SpinKitThreeBounce(size: 25, color: AppColor.white)),
                );
        })
      ],
    );
  }

  bool validateRole(BuildContext context) {
    if (Get.put(HomeController()).accountName.text.isEmpty) {
      flutterToast(msg: "Please enter account name");
      return false;
    }
    if (Get.put(HomeController()).whatsapp.text.isEmpty) {
      flutterToast(msg: "Please enter whatsapp number");
      return false;
    }
    if (Get.put(HomeController()).whatsapp.text.length < 9) {
      flutterToast(msg: "Please enter valid whatsapp number");
      return false;
    }
    if (Get.put(HomeController()).status2.value.isEmpty) {
      flutterToast(msg: "Please select status");
      return false;
    }

    return true;
  }
}
