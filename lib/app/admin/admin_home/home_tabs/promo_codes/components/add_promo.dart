import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';


class AddPromo extends StatefulWidget {
  AddPromo({Key? key,this.data1,this.data}) : super(key: key);
  var data;
  var data1;

  @override
  State<AddPromo> createState() => _AddPromoState();
}

class _AddPromoState extends State<AddPromo> {
  final homeController = Get.put(HomeController());
  String ?status;
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
        homeController.datePromo.text=widget.data1.expiredDate.toString(),
        homeController.promo.text=widget.data1.promocode.toString(),

        status=widget.data1.status==null?null:widget.data1.status,
        homeController.namePromo.text=widget.data1.title,
    homeController.discountPromo.text=widget.data1.discountPercent.toString(),

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
                              widget.data!="update"?
                              "Add New Promo Code":"Update Promo Code",
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
                            hint: "Name",
                            controller: homeController.namePromo,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "PromoCode"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            hint: "xxxxxxxxxx",
                            controller: homeController.promo,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Expiry Date"),
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
                                homeController.datePromo.text =
                                    DateFormat('dd-MM-yyyy')
                                        .format(pickedDate);
                              }
                            },


                            hint: "Expiry Date",

                            controller: homeController.datePromo,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Discount Percentage"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            max: 1,

                            hint: "xx",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.phone,

                            controller: homeController.discountPromo,
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
                                    color1: homeController.status1.value.isNotEmpty
                                        ? AppColor.btnColor.withOpacity(0.4)
                                        : AppColor.btnColor.withOpacity(0.4),
                                    contentPadding: EdgeInsets.only(
                                        top: Get.height * 0.016,
                                        bottom: Get.height * 0.016,
                                        right: 10),
                                    color: AppColor.btnColor.withOpacity(0.4),
                                    hinText: "Select Status",
                                    value: status,
                                    items: types.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        status=val.toString();
                                      });
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
                        buttonName: "Save",
                        fontWeight: FontWeight.w500,
                        textSize: AppSizes.size_15,
                        buttonColor: AppColor.btnColor,
                        textColor: AppColor.whiteColor,
                        onTap: widget.data=="update"?(){
                          if(validateAnn(context)){
                            homeController.updateAllLoader(true);
                            ApiManger().UpdatePromo(context: context,
                                id: widget.data1.id.toString(),
                                status: status.toString()
                            );

                          }
                        }:
                            () {
                          if(validateAnn(context)){
                            homeController.updateAllLoader(true);
                            ApiManger().addPromoResponse(context: context);

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
          return homeController.loaderUpdatesUser.value == false
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
    if (Get.put(HomeController()).namePromo.text.isEmpty) {
      flutterToast(msg: "Please enter title name");
      return false;
    }
    if (Get.put(HomeController()).promo.text.isEmpty) {
      flutterToast(msg: "Please enter promo code");
      return false;
    }
    if (Get.put(HomeController()).datePromo.text.isEmpty) {
      flutterToast(msg: "Please enter expire date");
      return false;
    }
    if (Get.put(HomeController()).discountPromo.text.isEmpty) {
      flutterToast(msg: "Please enter discount");
      return false;
    }


    return true;



  }
}

