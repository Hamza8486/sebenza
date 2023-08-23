import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/login.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';
import 'package:sebenza/app/widgets/app_text.dart';




class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final authController = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();

  List<String> types = [
   'Construction Industry'
  ];
  //stylist

  @override
  Widget build(BuildContext context) {

    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Padding(
            padding: AppPaddings.mainPadding,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Center(child: Image.asset("assets/images/logo.png",height: Get.height*0.057,)),

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Center(
                            child: AppText(
                              title: "TRY SEBENZA SYSTEMS FREE.",
                              size: AppSizes.size_14,
                              fontFamily: AppFont.medium,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textColor,
                            ),
                          ),

                          SizedBox(
                            height: Get.height * 0.03,
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
                            controller: authController.firstNameController,

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
                            controller: authController.lastNameController,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Email",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.013,
                          ),
                          sabenzaField( validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                            hint: "Example@gmail.com",
                            controller: authController.emailRegController,
                            textInputType: TextInputType.emailAddress
                          ),
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
                            controller: authController.companyNameController,

                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Account Type"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Obx(
                                  () {
                                return dropDownButtons(
                                    color2: AppColor.btnColor.withOpacity(0.4),
                                    color1:
                                    authController.accountType.value.isNotEmpty?AppColor.btnColor.withOpacity(0.4):
                                    AppColor.btnColor.withOpacity(0.4),
                                    contentPadding: EdgeInsets.only(
                                        top: Get.height * 0.016,bottom: Get.height * 0.016, right: 10),
                                    color: AppColor.btnColor.withOpacity(0.4),
                                    hinText: "Select Account Type",
                                    value: authController.accountTypeAll,
                                    onChanged: (value) async {

                                      for (int i = 0;
                                      i <
                                          authController
                                              .allAccountList.length;
                                      i++) {
                                        setState(() {
                                          if (authController
                                              .allAccountList[i].id == value) {
                                            authController.accountType.value =
                                                authController
                                                    .allAccountList[i].accountType.toString();

                                          }
                                        });

                                      }


                                    },
                                    items: countryDataList(
                                        dataList: authController
                                            .allAccountList));
                              }
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
                            controller: authController.counNameController,
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
                            controller: authController.cityNameController,
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
                            controller: authController.addressController,
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
                            controller: authController.phoneController,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Maximum User"),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          sabenzaField(

                            hint: "Maximum User",
                            textInputType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            controller: authController.maxNameController,
                          ),

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Password",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.013,
                          ),

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
                              obscure: authController.isVisible1.value,
                              controller: authController.passRegController,
                              child:    IconButton(
                                  onPressed: () {
                                    authController.updateVisible1Status();
                                  },
                                  icon: Icon(
                                      authController.isVisible1.value
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
                  ),
                ),
                isKeyBoard?SizedBox.shrink():
                Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    AppButton(
                        buttonWidth: Get.width,
                        buttonRadius: BorderRadius.circular(10),
                        buttonName: "Sign up",

                        fontWeight: FontWeight.w500,
                        textSize: AppSizes.size_15,
                        buttonColor: AppColor.btnColor,
                        textColor: AppColor.whiteColor,
                        onTap: () {
                          if(validateRegister(context)){
                            authController.updateLoader(true);
                            ApiManger().registerResponse(context: context);
                          }

                        }),
                    SizedBox(
                      height: Get.height * 0.013,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(LoginView());
                          Get.put(AuthController()).clear();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account ?  ",
                            style: TextStyle(
                                color:AppColor.btnColor.withOpacity(0.7),
                                fontFamily: AppFont.regular,
                                fontWeight: FontWeight.w500,
                                fontSize: AppSizes.size_15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                      color: AppColor.btnColor.withOpacity(0.7),
                                      fontFamily: AppFont.medium,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppSizes.size_15)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Obx(() {
          return authController.loader.value == false
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

  bool validateRegister(BuildContext context) {


    if (Get.put(AuthController()).firstNameController.text.isEmpty) {
      flutterToast(msg: "Please enter first name");
      return false;
    }
    if (Get.put(AuthController()).lastNameController.text.isEmpty) {
      flutterToast(msg: "Please enter last name");
      return false;
    }
    if (Get.put(AuthController()).emailRegController.text.isEmpty) {
      flutterToast(msg: "Please enter valid email");
      return false;
    }
    if (Get.put(AuthController()).companyNameController.text.isEmpty) {
      flutterToast(msg: "Please enter company name");
      return false;
    }

    if (Get.put(AuthController()).accountType.value.isEmpty) {
      flutterToast(msg: "Please select account type");
      return false;
    }
    if (Get.put(AuthController()).counNameController.text.isEmpty) {
      flutterToast(msg: "Please enter country name");
      return false;
    }
    if (Get.put(AuthController()).cityNameController.text.isEmpty) {
      flutterToast(msg: "Please enter city name");
      return false;
    }
    if (Get.put(AuthController()).addressController.text.isEmpty) {
      flutterToast(msg: "Please enter address");
      return false;
    }
    if (Get.put(AuthController()).phoneController.text.isEmpty) {
      flutterToast(msg: "Please enter phone number");
      return false;
    }
    if (Get.put(AuthController()).maxNameController.text.isEmpty) {
      flutterToast(msg: "Please enter max user");
      return false;
    }
    if (Get.put(AuthController()).passRegController.text.isEmpty) {
      flutterToast(msg: "Please enter password");
      return false;
    }

    if (Get.put(AuthController()).passRegController.text.length<7) {
      flutterToast(msg: "Password must be greater then 7 digit");
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
            title: dataList[i].accountType,
            size: AppSizes.size_15,
            color: AppColor.white.withOpacity(0.8),
            fontFamily: AppFont.regular,
            fontWeight: FontWeight.w500,
          )));
    }
    return outputList;
  }
}
