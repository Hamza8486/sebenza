import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/component/add_user.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/sign_up.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/app_button.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  List<String> types = [
    "Admin",
    "User",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Padding(
            padding: AppPaddings.mainPadding,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.18,
                    ),
                    Center(
                        child: Image.asset(
                      "assets/images/logo.png",
                      height: Get.height * 0.057,
                    )),
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    textAuth(
                        text: "Select Account Type", color: Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.013,
                    ),
                    Obx(() {
                      return dropDownButtons(
                          color2: AppColor.btnColor.withOpacity(0.4),
                          color1: authController.roleTypeName.value.isNotEmpty
                              ? AppColor.btnColor.withOpacity(0.4)
                              : AppColor.btnColor.withOpacity(0.4),
                          contentPadding: EdgeInsets.only(
                              top: Get.height * 0.016,
                              bottom: Get.height * 0.016,
                              right: 10),
                          color: AppColor.btnColor.withOpacity(0.4),
                          hinText: "Select account type",
                          value: authController.roleTypeName.value.isEmpty
                              ? null
                              : authController.roleTypeName.value,
                          items: types.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (val) {
                            authController.updateRoleName(val.toString());
                          });
                    }),
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
                      controller: authController.emailController,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    textAuth(text: "Password", color: Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.013,
                    ),
                    Obx(() {
                      return sabenzaField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }

                          return null;
                        },
                        hint: "Password",
                        textInputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscure: authController.isVisible.value,
                        controller: authController.passController,
                        child: IconButton(
                            onPressed: () {
                              authController.updateVisibleStatus();
                            },
                            icon: Icon(
                                authController.isVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: Get.height * 0.022,
                                color: AppColor.white)),
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.032,
                    ),
                    Obx(() {
                      return AppButton(
                          buttonWidth: Get.width,
                          buttonRadius: BorderRadius.circular(10),
                          buttonName: authController.userType.value == "user"
                              ? "Sign in"
                              : "Sign in",
                          fontWeight: FontWeight.w500,
                          textSize: AppSizes.size_15,
                          buttonColor: AppColor.btnColor,
                          textColor: AppColor.whiteColor,
                          onTap: authController.roleTypeName.value == "user"
                              ? () {
                                  if (formKey.currentState!.validate()) {
                                    if (authController
                                        .roleTypeName.value.isNotEmpty) {
                                      authController.updateLoginLoader(true);
                                      ApiManger()
                                          .loginResponse(context: context);
                                    } else {
                                      flutterToast(
                                          msg: "Please select account type");
                                    }
                                  }
                                }
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    if (authController
                                        .roleTypeName.value.isNotEmpty) {
                                      authController.updateLoginLoader(true);
                                      ApiManger()
                                          .loginAdminResponse(context: context);
                                    } else {
                                      flutterToast(
                                          msg: "Please select account type");
                                    }
                                  }
                                });
                    }),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(SignUpView());
                          Get.put(AuthController()).clear();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don’t have an account ?  ",
                            style: TextStyle(
                                color: AppColor.btnColor.withOpacity(0.7),
                                fontFamily: AppFont.regular,
                                fontWeight: FontWeight.w500,
                                fontSize: AppSizes.size_15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Sign up",
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
                  ],
                ),
              ),
            ),
          ),
        ),
        Obx(() {
          return authController.loaderLogin.value == false
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
}
