import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/user_home/home/user_tabs/expense/component/component.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';


class AddExpense extends StatefulWidget {
  AddExpense({Key? key,this.data1,this.data}) : super(key: key);
  var data;
  var data1;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final userController = Get.put(UserController());

 String? type;
 var typeId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data=="update"?


    (
        userController.notes.text=widget.data1.notes,
        typeId=widget.data1.expensetypeId,
        type=widget.data1.expensetypeId.toString(),
    userController.amount.text=widget.data1.amount.toString(),

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
                             widget.data=="update"?"Update New Expense":
                              "Add New Expense",
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
                          textAuth(text: "Expense Details"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(

                            hint: "Expense Name",
                            controller: userController.notes,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Expense Type"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Obx(
                                  () {
                                return dropDownButtons(
                                    color2: AppColor.btnColor.withOpacity(0.4),
                                    color1:
                                    userController.expenseList.isNotEmpty?AppColor.btnColor.withOpacity(0.4):
                                    AppColor.btnColor.withOpacity(0.4),
                                    contentPadding: EdgeInsets.only(
                                        top: Get.height * 0.016,bottom: Get.height * 0.016, right: 10),
                                    color: AppColor.btnColor.withOpacity(0.4),
                                    hinText: "Select Expense Type",
                                    value: typeId,
                                    onChanged: (value) async {

                                      for (int i = 0;
                                      i <
                                          userController
                                              .expenseTypeList.length;
                                      i++) {
                                        setState(() {
                                          typeId=value;
                                          if (userController
                                              .expenseTypeList[i].id == value) {
                                            type =
                                                userController
                                                    .expenseTypeList[i].expenceType.toString();


                                          }
                                        });

                                      }


                                    },
                                    items: countryDataList(
                                        dataList: userController
                                            .expenseTypeList));
                              }
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Total Amount"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.phone,
                            hint: "Amount",

                            controller: userController.amount,
                          ),


                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Choose File"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          UploadFile(text: "Choose",)


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
                        buttonName: "Save Expense",
                        fontWeight: FontWeight.w500,
                        textSize: AppSizes.size_15,
                        buttonColor: AppColor.btnColor,
                        textColor: AppColor.whiteColor,
                        onTap: widget.data=="update"?(){
                          if(validateAnn(context)){
                            userController.updateiNVOICELoader(true);
                            ApiManger().updateExpense(context: context,
                                id: typeId,
                                expId: widget.data1.id.toString()
                            );

                          }
                        }:
                            () {
                          if(validateAnn(context)){
                            userController.updateiNVOICELoader(true);
                            ApiManger().addExpense(context: context,id: typeId.toString());

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
          return userController.invoiceAllLoader.value == false
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
    if (Get.put(UserController()).notes.text.isEmpty) {
      flutterToast(msg: "Please enter expense name");
      return false;
    }
    if (type==null) {
      flutterToast(msg: "Please select expense type");
      return false;
    }
    if (Get.put(UserController()).amount.text.isEmpty) {
      flutterToast(msg: "Please enter amount");
      return false;
    }
    if(widget.data!="update"){
      if (Get.put(UserController()).file==null) {
        flutterToast(msg: "Please select file");
        return false;
      }
    }
    else{
      return true;
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

