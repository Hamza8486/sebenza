import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';

class AddUserView extends StatefulWidget {
  AddUserView({Key? key,this.data,this.data1}) : super(key: key);
  var data;
  var data1;

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // authController.roleTypeAll=widget.data1.roles[0].id.toString();
    widget.data=="update"?
   (homeController.updateRoleName( widget.data1.roles!.isNotEmpty?
       widget.data1.roles![0].name!.isNotEmpty?
       widget.data1.roles![0].name.toString():
       widget.data1.roles![1].name.toString():

       "superuser",),
       homeController.updateRollAll(
   widget.data1.roles![0].id),

       homeController.firstNameController.text=widget.data1.firstName,
    homeController.lastNameController.text=widget.data1.lastName,
    homeController.emailRegController.text=widget.data1.email,
    homeController.companyNameController.text=widget.data1.companyName==null?"":widget.data1.companyName,
    homeController.counNameController.text=widget.data1.country==null?"":widget.data1.country,
    homeController.cityNameController.text=widget.data1.city==null?"":widget.data1.city,
    homeController.addressController.text=widget.data1.address==null?"":widget.data1.address,
    homeController.phoneController.text=widget.data1.phone==null?"":widget.data1.phone):null;
    setState(() {

    });

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
                                      color:AppColor.white
                                  )),
                            ),
                            AppText(
                              title:
                              widget.data=="update"?"Update User":
                              "Add User",
                              color:AppColor.white,
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
                      textAuth(text: "User Role"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Obx(
                              () {
                            return dropDownButtons(
                                color2: AppColor.btnColor.withOpacity(0.4),
                                color1:
                                homeController.roleTypeName.value.isNotEmpty?AppColor.btnColor.withOpacity(0.4):
                                AppColor.btnColor.withOpacity(0.4),
                                contentPadding: EdgeInsets.only(
                                    top: Get.height * 0.016,bottom: Get.height * 0.016, right: 10),
                                color: AppColor.btnColor.withOpacity(0.4),
                                hinText: "Choose Category",
                                value: homeController.roleTypeAll,
                                onChanged: (value) async {

                                  for (int i = 0;
                                  i <
                                      homeController
                                          .rolesList.length;
                                  i++) {
                                    setState(() {
                                      if (homeController
                                          .rolesList[i].id == value) {
                                        homeController.roleTypeName.value =
                                            homeController
                                                .rolesList[i].name.toString();

                                      }
                                    });

                                  }


                                },
                                items: countryDataList(
                                    dataList: homeController.rolesList));
                          }
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "First Name"),
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
                        hint: "First name",
                        controller: homeController.firstNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Last Name"),
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
                        hint: "Last name",
                        controller: homeController.lastNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Email", color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.013,
                      ),
                      sabenzaField(
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                          hint: "Example@gmail.com",
                          controller: homeController.emailRegController,
                          textInputType: TextInputType.emailAddress),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Company Name"),
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
                        hint: "Company name",
                        controller: homeController.companyNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Country Name"),
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
                        hint: "Country name",
                        controller: homeController.counNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "City Name"),
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
                        hint: "City name",
                        controller: homeController.cityNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Address"),
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
                        hint: "Your Address",
                        controller: homeController.addressController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Mobile Number"),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      sabenzaField(
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        hint: "Mobile Number",
                        controller: homeController.phoneController,
                      ),
                      widget.data=="update"?SizedBox.shrink():
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      widget.data=="update"?SizedBox.shrink():
                      textAuth(text: "Password",color: Colors.transparent),
                      widget.data=="update"?SizedBox.shrink():
                      SizedBox(
                        height: Get.height * 0.013,
                      ),
                      widget.data=="update"?SizedBox.shrink():
                      Obx(() {
                        return sabenzaField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            // if(value.length<8)
                            // {
                            //   return 'Password must be greater then 8 character';
                            // }
                            return null;
                          },
                          hint: "Password",
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscure: homeController.isVisible2.value,
                          controller: homeController.passRegController,
                          child:    IconButton(
                              onPressed: () {
                                homeController.updateVisible2Status();
                              },
                              icon: Icon(
                                  homeController.isVisible2.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: Get.height * 0.022,
                                  color: AppColor.white)),
                        );
                      }),
                      SizedBox(
                        height: Get.height * 0.015,
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
                              buttonName:
                              widget.data=="update"?"Update User":
                              "Add User",
                              fontWeight: FontWeight.w500,
                              textSize: AppSizes.size_15,
                              buttonColor: AppColor.btnColor,
                              textColor: AppColor.whiteColor,
                              onTap:
                                 widget.data=="update"?(){
                                   if(validateUser(context)){
                                     homeController.updateUserLoader(true);
                                     ApiManger().updateUserResponse(context: context,
                                     id: widget.data1.id.toString()
                                     );
                                   }
                                 }:
                                  () {
                                if(validateUser(context)){
                                  homeController.updateUserLoader(true);
                                  ApiManger().addUserResponse(context: context);
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
          return homeController.loaderUser.value == false
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

  bool validateUser(BuildContext context) {
    if (Get.put(HomeController()).roleTypeName.value.isEmpty) {
      flutterToast(msg: "Please select user role");
      return false;
    }

    if (Get.put(HomeController()).firstNameController.text.isEmpty) {
      flutterToast(msg: "Please enter first name");
      return false;
    }
    if (Get.put(HomeController()).lastNameController.text.isEmpty) {
      flutterToast(msg: "Please enter last name");
      return false;
    }
    if (Get.put(HomeController()).emailRegController.text.isEmpty) {
      flutterToast(msg: "Please enter valid email");
      return false;
    }
    if (Get.put(HomeController()).companyNameController.text.isEmpty) {
      flutterToast(msg: "Please enter company name");
      return false;
    }


    if (Get.put(HomeController()).counNameController.text.isEmpty) {
      flutterToast(msg: "Please enter country name");
      return false;
    }
    if (Get.put(HomeController()).cityNameController.text.isEmpty) {
      flutterToast(msg: "Please enter city name");
      return false;
    }
    if (Get.put(HomeController()).addressController.text.isEmpty) {
      flutterToast(msg: "Please enter address");
      return false;
    }
    if (Get.put(HomeController()).phoneController.text.isEmpty) {
      flutterToast(msg: "Please enter phone number");
      return false;
    }
    if(widget.data=="update"){}
    else{
      if (Get.put(HomeController()).passRegController.text.isEmpty) {
        flutterToast(msg: "Please enter password");
        return

          false;
      }
    }









    return true;
  }
  List<DropdownMenuItem<int>> countryDataList({var dataList}) {
    List<DropdownMenuItem<int>> outputList = [];
    for (int i = 0; i < dataList.length; i++) {
      outputList.add(DropdownMenuItem<int>(
          value: dataList[i].id,
          child: AppText(
            title: dataList[i].name,
            size: AppSizes.size_15,
            color: AppColor.white.withOpacity(0.8),
            fontFamily: AppFont.regular,
            fontWeight: FontWeight.w500,
          )));
    }
    return outputList;
  }
}


Widget dropDownButtons(
    {value, onChanged, items, hinText, color, contentPadding, color1, color2,fontFamily ="regular",validator}) {
  return ButtonTheme(
      alignedDropdown: true,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: DropdownButtonFormField(
          menuMaxHeight: Get.height * 0.3,
          dropdownColor: AppColor.primaryColor,
          style: TextStyle(fontFamily: AppFont.medium,fontSize: AppSizes.size_13,
          color: AppColor.white.withOpacity(0.8)
          ),
          icon: SvgPicture.asset(
            "assets/icons/downs.svg",
            color: AppColor.white,
            height: Get.height * 0.008,
          ),
          validator: validator,


          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.transparent,
            filled: true,


            contentPadding: contentPadding,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: color),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: color),
            ),
          ),
          value: value,
          hint: SizedBox(
            width: Get.width*0.5,
            child: Text(
              hinText,
              maxLines: 1,
              style: TextStyle(
                  color: AppColor.white.withOpacity(0.8),
                  overflow: TextOverflow.ellipsis,
                  fontFamily: fontFamily,
                  fontSize: AppSizes.size_13),
            ),
          ),
          isExpanded: true,
          isDense: true,
          onChanged: onChanged,
          items: items));

}


