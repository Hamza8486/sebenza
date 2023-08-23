import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/authentication/component.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/sign_up.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_button.dart';


class LoginView extends StatelessWidget {
   LoginView({Key? key,this.type}) : super(key: key);
   var type;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();


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

                    textAuth(text: "Email", color: Colors.transparent),
                    SizedBox(
                      height: Get.height * 0.013,
                    ),
                    sabenzaField(
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                      hint: "Example@gmail.com",
                      controller:emailController,
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
                        obscure: Get.put(AuthController()).isVisible.value,
                        controller: passController,
                        child: IconButton(
                            onPressed: () {
                              Get.put(AuthController()).updateVisibleStatus();
                            },
                            icon: Icon(
                                Get.put(AuthController()).isVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: Get.height * 0.022,
                                color: AppColor.white)),
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.032,
                    ),
                    AppButton(
                        buttonWidth: Get.width,
                        buttonRadius: BorderRadius.circular(10),
                        buttonName:  "Sign in",
                        fontWeight: FontWeight.w500,
                        textSize: AppSizes.size_15,
                        buttonColor: AppColor.btnColor,
                        textColor: AppColor.whiteColor,
                        onTap: type=="user"? ()

                        {
                          if (formKey.currentState!.validate()) {
                            Get.put(AuthController()).updateLoginLoader(true);
                            ApiManger()
                                .loginUserResponse(context: context,
                                email: emailController.text,
                                password: passController.text,

                            );
                          }
                        }:()

                        {
                          if (formKey.currentState!.validate()) {
                            Get.put(AuthController()).updateLoginLoader(true);
                            ApiManger()
                                .loginAdminResponse(context: context,
                              email: emailController.text,
                              password: passController.text,

                            );
                          }
                        }

                        ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.put(AuthController()).getAccountData();
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
          return Get.put(AuthController()).loaderLogin.value == false
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


