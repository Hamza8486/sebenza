import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_invoice/model/admin_invoice_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_invoice/model/invoice_detail.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/admin_orders/model/order_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/annoucement/model/updates_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/promo_codes/model/promo_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/roles/model/roles_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/setting/model/basic_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/model/all_accounts_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/model/all_tickets_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/tickets/model/ticket_detail_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/model/get_user_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/model/roles_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user_type/model/account_type_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/whats_pp/model/whats_model.dart';
import 'package:sebenza/app/admin/admin_home/home_view.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/login.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/user_home/home/user_home.dart';
import 'package:sebenza/app/user_home/home/user_tabs/announcement/model/model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/calendar/model/calendar_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/expense/model/expense_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/expense/model/type_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/invoice/model/invoice_detail.dart';
import 'package:sebenza/app/user_home/home/user_tabs/invoice/model/invoice_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/meeting/model/model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/my_task/model/task_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/orders/model/order_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/ticket_systtem/model/reply_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/ticket_systtem/model/ticket_user_model.dart';
import 'package:sebenza/app/util/constant.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class ApiManger extends GetConnect {
  static var client = http.Client();

  static Uri uriPath({required String nameUrl}) {
    print("Url: ${AppConstants.baseURL}$nameUrl");
    return Uri.parse(AppConstants.baseURL + nameUrl);
  }




  loginAdminResponse({required BuildContext context, email, password}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'email': email.toString(),
        'password': password.toString(),
      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
        AppConstants.baseURL + AppConstants.adminLogin,
        data: data,
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {



        Get.put(AuthController()).updateLoginLoader(false);
        flutterToast(msg: response.data["message"].toString());

        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode==201){
        HelperFunctions.saveInPreference(
            "token", response.data['data']['token'].toString());

        HelperFunctions.saveInPreference(
            "name", response.data['data']["user"]['first_name'].toString());
        HelperFunctions.saveInPreference(
            "nameLast", response.data['data']["user"]['last_name'].toString());
        HelperFunctions.saveInPreference(
            "email", response.data['data']["user"]['email'].toString());
        HelperFunctions.saveInPreference(
            "phone", response.data['data']["user"]['phone'].toString());
        HelperFunctions.saveInPreference(
            "id", response.data['data']["user"]['id'].toString());
        HelperFunctions.saveInPreference(
            "type", "admin");

        Get.offAll(() => HomeView(), transition: Transition.cupertinoDialog);
        Get.put(AuthController()).updateLoginLoader(false);
        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(AuthController()).updateLoginLoader(false);
      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  loginUserResponse({required BuildContext context, email, password}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'email': email.toString(),
        'password':password.toString(),
      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
        AppConstants.baseURL + AppConstants.login,
        data: data,
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {



        Get.put(AuthController()).updateLoginLoader(false);
        flutterToast(msg: response.data["message"].toString());

        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode==201){
        HelperFunctions.saveInPreference(
            "token", response.data['data']['token'].toString());

        HelperFunctions.saveInPreference(
            "name", response.data['data']["user"]['first_name'].toString());
        HelperFunctions.saveInPreference(
            "nameLast", response.data['data']["user"]['last_name'].toString());
        HelperFunctions.saveInPreference(
            "email", response.data['data']["user"]['email'].toString());
        HelperFunctions.saveInPreference(
            "phone", response.data['data']["user"]['phone'].toString());
        HelperFunctions.saveInPreference(
            "id", response.data['data']["user"]['id'].toString());
        HelperFunctions.saveInPreference(
            "type", "user");

        Get.offAll(() => UserHome(), transition: Transition.cupertinoDialog);
        Get.put(AuthController()).updateLoginLoader(false);
        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(AuthController()).updateLoginLoader(false);
      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


registerResponse({required BuildContext context}) async {
  try {
    dio.FormData data = dio.FormData.fromMap({
      'first_name': Get.put(AuthController()).firstNameController.text,
      'last_name': Get.put(AuthController()).lastNameController.text,
      'phone': Get.put(AuthController()).phoneController.text,
      'email': Get.put(AuthController()).emailRegController.text,
      'password': Get.put(AuthController()).passRegController.text,
      'company_name': Get.put(AuthController()).companyNameController.text,
      'account_type_id':"",
      'country': Get.put(AuthController()).counNameController.text,
      'city': Get.put(AuthController()).cityNameController.text,
      'address': Get.put(AuthController()).addressController.text,
      'user_limit_id': Get.put(AuthController()).maxNameController.text,
    });
    print("Data::::: ${data.fields}");
    print("Data::::: ${data.fields}");
    var response = await dio.Dio().post(
      AppConstants.baseURL + AppConstants.register,
      data: data,
    );

    if (response.statusCode == 200) {

      Get.put(AuthController()).updateLoader(false);
      Get.put(AuthController()).clear();
      flutterToastSuccess(msg: "Account Register Successfully");
      Get.offAll(LoginView());

      debugPrint(response.data.toString());
      debugPrint(response.data.toString());
    }
    else if(response.statusCode == 201){
      Get.put(AuthController()).updateLoader(false);

      flutterToast(msg: response.data["message"].toString());
    }
  } on dio.DioError catch (e) {
    Get.put(AuthController()).updateLoader(false);

    flutterToast(msg: e.response?.data["message"].toString());
    debugPrint("e.response");
    debugPrint(e.response.toString());
  }
}




  addUserResponse({required BuildContext context}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'first_name': Get.put(HomeController()).firstNameController.text,
        'last_name': Get.put(HomeController()).lastNameController.text,
        'phone': Get.put(HomeController()).phoneController.text,
        'email': Get.put(HomeController()).emailRegController.text,
        'password': Get.put(HomeController()).passRegController.text,
        'company_name': Get.put(HomeController()).companyNameController.text,
        'roles':Get.put(HomeController()).roleTypeName.value,
        'country': Get.put(HomeController()).counNameController.text,
        'city': Get.put(HomeController()).cityNameController.text,
        'address': Get.put(HomeController()).addressController.text,
      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
        AppConstants.baseURL + AppConstants.addUser,
        data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {

        Get.put(HomeController()).updateUserLoader(false);
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getUserData(search: "");
        Navigator.pop(context);

        flutterToastSuccess(msg: "User Created Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }





  addUserRole({required BuildContext context}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'roleName': Get.put(HomeController()).roleRegController.text,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.addUserRole,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getUserRolesData(id: "");
        Get.back();
        Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Roles Created Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  addAccountType({required BuildContext context}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'account_type': Get.put(HomeController()).accountTypeName.text,
        'status': Get.put(HomeController()).status.value,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.addAccount,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getAccountData(search: "");
        Get.put(HomeController()).updateUserTypeLoader(false);
        Get.back();
        Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Account Type Created Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserTypeLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserTypeLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  addWhatsappType({required BuildContext context}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'user_name': Get.put(HomeController()).accountName.text,
        'whatsapp_number': Get.put(HomeController()).whatsapp.text,
        'status': Get.put(HomeController()).status2.value.toString(),

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}admin/whatsapps",
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getWhatsaData(search: "");
        Get.put(HomeController()).updateUserTypeLoader(false);
        Get.back();
        Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Created Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserTypeLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserTypeLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  addUpdateResponse({context}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'title': Get.put(HomeController()).title.text,
          'description': Get.put(HomeController()).des.text,

          Get.put(HomeController()).file1 == null ? "" : 'postImage':
          Get.put(HomeController()).file1 == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(HomeController()).file1!.path),
        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.addUpdates,
          data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        if (response.statusCode == 200) {

          Get.put(HomeController()).getUpdatesData();
          Get.back();
          Get.put(HomeController()).updateAllLoader(false);
          Get.put(HomeController()).clear();



          flutterToastSuccess(msg: "Updates Add Successfully");

        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateAllLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        Get.put(HomeController()).updateAllLoader(false);

        flutterToast(msg: e.response?.data["message"].toString());
        // log("e.response");


      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateAllLoader(false);
      flutterToast(msg: e.response?.data["message"].toString());
      log(e.toString());
    }
  }


  addPromoResponse({context}) async {

      try {
        dio.FormData data = dio.FormData.fromMap({
          'title': Get.put(HomeController()).namePromo.text,
          'promocode': Get.put(HomeController()).promo.text,
          'expired_date': Get.put(HomeController()).datePromo.text,
          'discount_percent': Get.put(HomeController()).discountPromo.text,
        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().post(
            AppConstants.baseURL + AppConstants.addPromo,
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        if (response.statusCode == 200) {

          Get.put(HomeController()).getPromoData();
          Get.back();
          Get.put(HomeController()).updateAllLoader(false);
          Get.put(HomeController()).clear();



          flutterToastSuccess(msg: "Promo Add Successfully");

        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateAllLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        Get.put(HomeController()).updateAllLoader(false);

        flutterToast(msg: e.response?.data["message"].toString());
        // log("e.response");


      }

  }



  UpdateResponse({context,slug,id}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'title': Get.put(HomeController()).title.text,
          'description': Get.put(HomeController()).des.text,
          'slug':slug.toString(),
          'status': Get.put(HomeController()).status1.value,

          Get.put(HomeController()).file1 == null ? "" : 'postImage':
          Get.put(HomeController()).file1 == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(HomeController()).file1!.path),
        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.UpdatesAnnouc}${id.toString()}",
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        if (response.statusCode == 200) {

          Get.put(HomeController()).getUpdatesData();
          Get.back();
          Get.put(HomeController()).updateAllLoader(false);
          Get.put(HomeController()).clear();



          flutterToastSuccess(msg: "Updates Add Successfully");

        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateAllLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        Get.put(HomeController()).updateAllLoader(false);

        flutterToast(msg: e.response?.data["message"].toString());
        // log("e.response");


      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateAllLoader(false);
      flutterToast(msg: e.response?.data["message"].toString());
      log(e.toString());
    }
  }





  UpdatePromo({context,status,id}) async {


      try {
        dio.FormData data = dio.FormData.fromMap({
          'title': Get.put(HomeController()).namePromo.text,
          'promocode': Get.put(HomeController()).promo.text,
          'expired_date':Get.put(HomeController()).datePromo.text,
          'discount_percent': Get.put(HomeController()).discountPromo.text,
          'status': status.toString(),


        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.UpdatesPromo}${id.toString()}",
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        if (response.statusCode == 200) {

          Get.put(HomeController()).getPromoData();
          Get.back();
          Get.put(HomeController()).updateAllLoader(false);
          Get.put(HomeController()).clear();



          flutterToastSuccess(msg: "Updates Successfully");

        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateAllLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        Get.put(HomeController()).updateAllLoader(false);

        flutterToast(msg: e.response?.data["message"].toString());
        // log("e.response");


      }

  }



  updateAccountType({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'account_type': Get.put(HomeController()).accountTypeName.text,
        'status': Get.put(HomeController()).status.value,
        'account_type_id': id.toString(),

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.updateAccount,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getAccountData(search: "");
        Get.put(HomeController()).updateUserTypeLoader(false);
        Get.back();
        Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Updated Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserTypeLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserTypeLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  updateWhatsapp({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'user_name': Get.put(HomeController()).accountName.text,
        'whatsapp_number': Get.put(HomeController()).whatsapp.text,
        'status': Get.put(HomeController()).status2.value.toString(),

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateWhatsapp}${id.toString()}",
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getWhatsaData(search: "");
        Get.put(HomeController()).updateUserTypeLoader(false);
        Get.back();
        Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Updated Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserTypeLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserTypeLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  updateUserResponse({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'first_name': Get.put(HomeController()).firstNameController.text,
        'last_name': Get.put(HomeController()).lastNameController.text,
        'phone': Get.put(HomeController()).phoneController.text,
        'email': Get.put(HomeController()).emailRegController.text,
        'password': Get.put(HomeController()).passRegController.text,
        'company_name': Get.put(HomeController()).companyNameController.text,
        'roles':Get.put(HomeController()).roleTypeName.value,
        'country': Get.put(HomeController()).counNameController.text,
        'city': Get.put(HomeController()).cityNameController.text,
        'address': Get.put(HomeController()).addressController.text,
      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateUser}${id.toString()}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getUserData(search: "");
        Get.put(HomeController()).updateUserLoader(false);
        Get.put(HomeController()).clear();

        Navigator.pop(context);

        flutterToastSuccess(msg: "User Updated Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  updateRoleResponse({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'roleName': Get.put(HomeController()).roleRegController.text,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateUserRole}${id.toString()}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        Get.put(HomeController()).getUserRolesData(id: "");
        Get.back();
        Get.put(HomeController()).clear();


        flutterToastSuccess(msg: "Role Updated Successfully");


        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateUserLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUserLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  static Future<GetUserModel?> getUserModel({search}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.getUser}?search=${search.toString()}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return GetUserModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }

  static Future<GetUserRoles?> getUserRoles() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.ROLES),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return GetUserRoles.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<BasicModel?> getBasicModel() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getBasic),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return BasicModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<RolesModel?> rolesModel({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.userRoles}?search=${id.toString()}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return RolesModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<AccountTypeModel?> getAccount({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.getAccount}?search=${id.toString()}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return AccountTypeModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<WhatsappModel?> getWhatsapp({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.getWhatsapp}?search=${id.toString()}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return WhatsappModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }


  static Future<TicketDetailModel?> getDetailTicket({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.detailTickets}${id.toString()}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      Get.put(HomeController()).scrollToLastMessage();
      Get.put(HomeController()).getTicketsData();
      return TicketDetailModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }

  static Future<AllAccountListModel?> allAccountTickets() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.allAccounts),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer 20|YycpzG74XzHuM98yhip8dvjQ05bzyWiFQEq8csp5"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return AllAccountListModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  static Future<PromoModel?> getAllPromo() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getPromo),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return PromoModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<UpdatesModel?> getUpdates() async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.getUpdates}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return UpdatesModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }





  static Future<AllTicketsModel?> allTicketsModel() async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.allTickets}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return AllTicketsModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }

  deleteResponse({id}) async {
    try {
      var response = await dio.Dio().delete(
        "${AppConstants.baseURL}${AppConstants.delUser}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "User Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getUserData(search: "");
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  deleteRole({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delRole}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Role Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getUserRolesData(id: "");
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  deleteOrders({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.deleteOrder}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Order Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getOrderData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  deleteInvoice({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delInvoice}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Invoice Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getInvoiceData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  deleteType({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delType}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getAccountData(search: "");
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  deletePromo({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delPromo}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getPromoData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  deleteWhatsapp({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delWhatsapp}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getWhatsaData(search: "");
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  deleteUpdate({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delUpdates}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(HomeController()).clear();
        Get.put(HomeController()).getUpdatesData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  updateBasicResponse({context,title,email,contact,address}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'title': title.toString(),
          'email': email.toString(),
          'contact':contact.toString(),
          'address': address.toString(),

          Get.put(HomeController()).basicFile == null ? "" : 'logo':
          Get.put(HomeController()).basicFile == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(HomeController()).basicFile!.path),
        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.updateBasic}",
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        if (response.statusCode == 200) {

          Get.put(HomeController()).getBasicData();
        //  Get.back();
          Get.put(HomeController()).updateBasicLoader(false);
         // Get.put(HomeController()).clear();



          flutterToastSuccess(msg: "Update Settings Successfully");

        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateBasicLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        Get.put(HomeController()).updateBasicLoader(false);

        flutterToast(msg: e.response?.data["message"].toString());
        // log("e.response");


      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateBasicLoader(false);
      flutterToast(msg: e.response?.data["message"].toString());
      log(e.toString());
    }
  }


  updateMeta({name,des,key}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'site_name': name.toString(),
        'meta_description': des.toString(),
        'meta_keyword':key.toString(),

      });
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateMeta}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {

        Get.put(HomeController()).getBasicData();
       // Get.back();
        Get.put(HomeController()).updateBasicLoader(false);
       // Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Update Settings Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateBasicLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }





  updateFace({face,google}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'facebook_pixel': face.toString(),
        'google_analytics': google.toString(),


      });
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateFace}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {

        Get.put(HomeController()).getBasicData();
        // Get.back();
        Get.put(HomeController()).updateBasicLoader(false);
        //Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Update Settings Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateBasicLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  updateSocials() async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'facebook': Get.put(HomeController()).faceController.text,
        'instagram':Get.put(HomeController()).instaController.text,
        'tiktok': Get.put(HomeController()).tikController.text,
        'pinterest':Get.put(HomeController()).pintController.text,
        'twitter': Get.put(HomeController()).twitController.text,
        'google':Get.put(HomeController()).googleController.text,
        'rss': Get.put(HomeController()).rssController.text,
        'linkedin':Get.put(HomeController()).linkController.text,
        'youtube': Get.put(HomeController()).youController.text,


      });
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.socialLinks}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {

        Get.put(HomeController()).getBasicData();
       // Get.back();
        Get.put(HomeController()).updateBasicLoader(false);
        // Get.put(HomeController()).clear();



        flutterToastSuccess(msg: "Update Settings Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(HomeController()).updateBasicLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  sendMessage({required BuildContext context,type,reply,id}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'type':type.toString(),
          'replay':reply.toString(),
          Get.put(HomeController()).file2==null?"":
          'replayatt': Get.put(HomeController()).file2 == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(HomeController()).file1!.path),
        });
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.sendMessage}${id.toString()}",
            data: data,
            options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        print(data.fields);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.put(HomeController()).updateSendLoader(false);
          Get.put(HomeController()).getTicketDetailData(id:Get.put(HomeController()).updateId.toString() );
        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateSendLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        flutterToast(msg: e.response?.data["message"].toString());
        Get.put(HomeController()).updateSendLoader(false);


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }
    } on dio.DioError catch (e) {
      flutterToast(msg: e.response?.data["message"].toString());
      Get.put(HomeController()).updateSendLoader(false);


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  updateTickets({required BuildContext context,type,id}) async {

      try {
        dio.FormData data = dio.FormData.fromMap({
          'status':type.toString(),

        });
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.updateTickets}${id.toString()}",
            data: data,
            options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

            })
        );
        print(data.fields);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.put(HomeController()).updateTickLoader(false);
          Get.back();
          flutterToastSuccess(msg: "Status Updated");
          Get.put(HomeController()).getTicketsData();
          Get.put(HomeController()).updateTab(0);
        }
        else if(response.statusCode == 201){
          Get.put(HomeController()).updateTickLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        flutterToast(msg: e.response?.data["message"].toString());
        Get.put(HomeController()).updateTickLoader(false);


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }

  }



  /// User Side

  static Future<MeetingsModel?> getMeeting() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getMeeting),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return MeetingsModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }

  static Future<TaskModel?> getTask() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getTask),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return TaskModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  static Future<InvoiceModel?> getInvoice() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getInvoice),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return InvoiceModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<InvoiceAdminModel?> getAdminInvoice() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.adminInvoiceAll),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return InvoiceAdminModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<InvoiceDetailModel?> getDetailInvoice({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.detailInvoice}${id.toString()}/edit"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return InvoiceDetailModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  static Future<InvoiceAdminDetailModel?> invoiceAdminDetail({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.detailAdminInvoice}${id.toString()}/edit"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return InvoiceAdminDetailModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  static Future<ExpenceTypeModel?> expenseType() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getExpenseType),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return ExpenceTypeModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }


  static Future<ExpenceModel?> expenseModel() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getExpense),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return ExpenceModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  addMeetings({context,platform}) async {

    try {
      dio.FormData data = dio.FormData.fromMap({
        'title': Get.put(UserController()).title.text,
        'place': platform.toString(),
        'description': Get.put(UserController()).des.text,
        'date': Get.put(UserController()).date.text,
        'link': Get.put(UserController()).link.text,
        'time': Get.put(UserController()).time.text,
      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.addMeeting,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      if (response.statusCode == 200) {

        Get.put(UserController()).getMeetingData();
        Get.back();
        Get.put(UserController()).updateAllLoader(false);
        Get.put(UserController()).clear();



        flutterToastSuccess(msg: "Meeting Add Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(UserController()).updateAllLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(UserController()).updateAllLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      // log("e.response");


    }

  }


  addTask({context}) async {

    try {
      dio.FormData data = dio.FormData.fromMap({
        'name': Get.put(UserController()).taskName.text,
        'details': Get.put(UserController()).taskDetail.text,
        'date': Get.put(UserController()).taskDate.text,

        'time': Get.put(UserController()).taskTime.text,
      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.addTask,
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      if (response.statusCode == 200) {

        Get.put(UserController()).getTaskData();
        Get.back();
        Get.put(UserController()).updateTaskAllLoader(false);
        Get.put(UserController()).clear();



        flutterToastSuccess(msg: "Task Add Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(UserController()).updateTaskAllLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(UserController()).updateTaskAllLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      // log("e.response");


    }

  }



  addExpense({required BuildContext context,id}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'expensetype_id':id.toString(),
          'amount':Get.put(UserController()).amount.text,
          'notes':Get.put(UserController()).notes.text,
          Get.put(UserController()).file==null?"":
          'image': Get.put(UserController()).file == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(UserController()).file!.path),
        });
        print(data.fields);
        print(data.fields);
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.addExpense}",
            data: data,
            options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

            })
        );
        print(data.fields);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.put(UserController()).getExpenseData();
          Get.back();
          flutterToastSuccess(msg: "Expense Add Successfully");
          Get.put(UserController()).updateiNVOICELoader(false);
        }
        else if(response.statusCode == 201){

          Get.put(UserController()).updateiNVOICELoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        flutterToast(msg: e.response?.data["message"].toString());
        Get.put(UserController()).updateiNVOICELoader(false);


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }
    } on dio.DioError catch (e) {
      flutterToast(msg: e.response?.data["message"].toString());
      Get.put(UserController()).updateiNVOICELoader(false);


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  addTicket({required BuildContext context,dep,pir}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'subject':Get.put(UserController()).subject.text,
          'department':dep.toString(),
          'priority':pir.toString(),
          'message':Get.put(UserController()).ticketDes.text,
          Get.put(UserController()).fileTicket==null?"":
          'attachment': Get.put(UserController()).fileTicket == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(UserController()).fileTicket!.path),
        });
        print(data.fields);
        print(data.fields);
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.addTicket}",
            data: data,
            options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

            })
        );
        print(data.fields);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200) {

          flutterToastSuccess(msg: "Ticket Add Successfully");
          Get.put(UserController()).getTicketsData();
          Get.back();
          Get.put(UserController()).updateAddTicketLoader(false);
          Get.put(UserController()).clear();
        }
        else if(response.statusCode == 201){

          Get.put(UserController()).updateAddTicketLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        flutterToast(msg: e.response?.data["message"].toString());
        Get.put(UserController()).updateAddTicketLoader(false);


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }
    } on dio.DioError catch (e) {
      flutterToast(msg: e.response?.data["message"].toString());
      Get.put(UserController()).updateAddTicketLoader(false);


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  updateExpense({required BuildContext context,id,expId}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'expensetype_id':id.toString(),
          'amount':Get.put(UserController()).amount.text,
          'notes':Get.put(UserController()).notes.text,
          Get.put(UserController()).file==null?"":
          'image': Get.put(UserController()).file == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(UserController()).file!.path),
        });
        print(data.fields);
        print(data.fields);
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.updateExpense}${expId.toString()}",
            data: data,
            options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

            })
        );
        print(data.fields);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.put(UserController()).getExpenseData();
          Get.back();
          flutterToastSuccess(msg: "Expense Update Successfully");
          Get.put(UserController()).updateiNVOICELoader(false);
        }
        else if(response.statusCode == 201){

          Get.put(UserController()).updateiNVOICELoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        flutterToast(msg: e.response?.data["message"].toString());
        Get.put(UserController()).updateiNVOICELoader(false);


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }
    } on dio.DioError catch (e) {
      flutterToast(msg: e.response?.data["message"].toString());
      Get.put(UserController()).updateiNVOICELoader(false);


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }

  deleteExpense({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delExpense}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(UserController()).clear();
        Get.put(UserController()).getExpenseData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  deleteMeetings({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delMeetings}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(UserController()).clear();
        Get.put(UserController()).getMeetingData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  deleteTask({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delTask}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(UserController()).clear();
        Get.put(UserController()).getTaskData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }

  deleteCal({id}) async {
    try {
      var response = await dio.Dio().delete(
          "${AppConstants.baseURL}${AppConstants.delCalend}${id.toString()}",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToast(msg: "Deleted");
        Get.back();
        Get.put(UserController()).clear();
        Get.put(UserController()).getCalendarData();
        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }

  UpdateMeeting({context,platform,id,status}) async {


    try {
      dio.FormData data = dio.FormData.fromMap({
        'title': Get.put(UserController()).title.text,
        'place': platform.toString(),
        'description': Get.put(UserController()).des.text,
        'date': Get.put(UserController()).date.text,
        'link': Get.put(UserController()).link.text,
        'time': Get.put(UserController()).time.text,
        'status': status.toString(),


      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateMeetings}${id.toString()}",
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      if (response.statusCode == 200) {

        Get.put(UserController()).getMeetingData();
        Get.back();
        Get.put(UserController()).updateAllLoader(false);
        Get.put(UserController()).clear();



        flutterToastSuccess(msg: "Updates Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(UserController()).updateAllLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(UserController()).updateAllLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      // log("e.response");


    }

  }



  UpdateTask({context,id,status}) async {


    try {
      dio.FormData data = dio.FormData.fromMap({
        'name': Get.put(UserController()).taskName.text,
        'details': Get.put(UserController()).taskDetail.text,
        'date': Get.put(UserController()).taskDate.text,

        'time': Get.put(UserController()).taskTime.text,
        'status': status.toString(),


      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateTask}${id.toString()}",
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      if (response.statusCode == 200) {

        Get.put(UserController()).getTaskData();
        Get.back();
        Get.put(UserController()).updateTaskAllLoader(false);
        Get.put(UserController()).clear();



        flutterToastSuccess(msg: "Updates Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(UserController()).updateTaskAllLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(UserController()).updateTaskAllLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      // log("e.response");


    }

  }



  static Future<AnnoucementModel?> announceModel() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getUpdatesUser),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return AnnoucementModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }


  static Future<TicketUserModel?> ticketUserModel() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getTicket),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return TicketUserModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  static Future<ReplyUserModel?> replyTicket({id}) async {
    var response = await client.get(uriPath(nameUrl: "${AppConstants.replyTicket}${id.toString()}"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      Get.put(UserController()).scrollToLastMessage();
      Get.put(UserController()).getTicketsData();
      return ReplyUserModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }


  sendUserMessage({required BuildContext context,type,reply,id}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'type':type.toString(),
          'replay':reply.toString(),
          Get.put(UserController()).file2==null?"":
          'replayatt': Get.put(UserController()).file2 == null
              ? ""
              : await dio.MultipartFile.fromFile(
              Get.put(UserController()).file2!.path),
        });
        var response = await dio.Dio().post(
            "${AppConstants.baseURL}${AppConstants.replySendTicket}${id.toString()}",
            data: data,
            options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

            })
        );
        print(data.fields);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.put(UserController()).file2=null;
          Get.put(UserController()).updateSendLoader(false);
          Get.put(UserController()).getTicketDetailData(id:Get.put(UserController()).updateId.toString() );
        }
        else if(response.statusCode == 201){
          Get.put(UserController()).updateSendLoader(false);

          flutterToast(msg: response.data["message"].toString());
        }
      } on dio.DioError catch (e) {
        flutterToast(msg: e.response?.data["message"].toString());
        Get.put(UserController()).updateSendLoader(false);


        debugPrint("e.response");
        debugPrint(e.response.toString());
      }
    } on dio.DioError catch (e) {
      flutterToast(msg: e.response?.data["message"].toString());
      Get.put(UserController()).updateSendLoader(false);


      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  static Future<GetOrders?> getUserOrders() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getUserOrders),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return GetOrders.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  static Future<AdminOrders?> getAdminOrders() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.adminOrders),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return AdminOrders.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  updatePackages({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'new_user': Get.put(UserController()).users.text,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.addUserNew}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        if(response.data["message"]=="Please paid your previous invoice.Then try to update"){
          Get.back();
          Get.put(UserController()).clear();
          flutterToastSuccess(msg: response.data["message"].toString());
        }
        else{
          Get.put(UserController()).getOrderData();
          Get.back();
          Get.put(UserController()).clear();


          flutterToastSuccess(msg: "Updated Successfully");
        }



        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.back();

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  updateAdminPackages({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'new_user': Get.put(HomeController()).users.text,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.adminUpdateOrders}${id.toString()}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        if(response.data["message"]=="Please paid your previous invoice.Then try to update"){
          Get.back();
          Get.put(HomeController()).clear();
          flutterToastSuccess(msg: response.data["message"].toString());
        }
        else{
          Get.put(HomeController()).getOrderData();
          Get.back();
          Get.put(HomeController()).clear();


          flutterToastSuccess(msg: "Updated Successfully");
        }



        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.back();

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }




  updateAdminInvoice({required BuildContext context,id}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'discount': Get.put(HomeController()).users.text,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.adminUpdateInvoice}${id.toString()}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(HomeController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        if(response.data["message"]=="Please paid your previous invoice.Then try to update"){
          Get.back();
          Get.put(HomeController()).clear();
          flutterToastSuccess(msg: response.data["message"].toString());
        }
        else{
          Get.put(HomeController()).getInvoiceData();
          Get.back();
          Get.put(HomeController()).clear();
          flutterToastSuccess(msg: response.data["message"].toString());

        }



        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode == 201){
        Get.back();

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.back();

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }



  addCalendarResp({required BuildContext context,color}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'title': Get.put(UserController()).eventName.text,
        'details': Get.put(UserController()).eventDetail.text,
        'bgColor': color.toString(),
        'startDate': Get.put(UserController()).eventStart.text,
        'startTime': Get.put(UserController()).eventTime.text,
        'endDate': Get.put(UserController()).eventEnd.text,
        'endTime': Get.put(UserController()).eventTimeEnd.text,

      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.addCalend}",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );

      if (response.statusCode == 200) {
        print(response.data);
        Get.put(UserController()).getCalendarData();
        Get.put(UserController()).updateAddCalLoader(false);


        Get.back();
        flutterToastSuccess(msg: "Event Add Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(UserController()).updateAddCalLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(UserController()).updateAddCalLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      debugPrint("e.response");
      debugPrint(e.response.toString());
    }
  }


  static Future<GetCalendarModel?> getCalendar() async {
    var response = await client.get(uriPath(nameUrl: AppConstants.getCalend),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"
        });
    debugPrint("response.statusCode");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return GetCalendarModel.fromJson(jsonString);
    } else {
      debugPrint(response.statusCode.toString());

      //show error message
      return null;
    }
  }




  updateCalendar({context,id,color,status}) async {


    try {
      dio.FormData data = dio.FormData.fromMap({
        'title': Get.put(UserController()).eventName.text,
        'details': Get.put(UserController()).eventDetail.text,
        'bgColor': color.toString(),
        'startDate': Get.put(UserController()).eventStart.text,
        'startTime': Get.put(UserController()).eventTime.text,
        'endDate': Get.put(UserController()).eventEnd.text,
        'endTime': Get.put(UserController()).eventTimeEnd.text,
        'status': status.toString(),


      });
      print("Data::::: ${data.fields}");
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          "${AppConstants.baseURL}${AppConstants.updateCalend}${id.toString()}",
          data: data,
          options: dio.Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${Get.put(UserController()).token.value}"

          })
      );
      if (response.statusCode == 200) {

        Get.put(UserController()).getCalendarData();
        Get.back();
        Get.put(UserController()).updateAddCalLoader(false);
        Get.put(UserController()).clear();



        flutterToastSuccess(msg: "Updates Successfully");

      }
      else if(response.statusCode == 201){
        Get.put(UserController()).updateAddCalLoader(false);

        flutterToast(msg: response.data["message"].toString());
      }
    } on dio.DioError catch (e) {
      Get.put(UserController()).updateAddCalLoader(false);

      flutterToast(msg: e.response?.data["message"].toString());
      // log("e.response");


    }

  }
}
