import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sebenza/app/admin/admin_home/controller/home_controller.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/annoucement/model/updates_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/roles/model/roles_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/setting/model/basic_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/model/get_user_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/model/roles_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user_type/model/account_type_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/whats_pp/model/whats_model.dart';
import 'package:sebenza/app/admin/admin_home/home_view.dart';
import 'package:sebenza/app/authentication/controller.dart';
import 'package:sebenza/app/authentication/login.dart';
import 'package:sebenza/app/util/constant.dart';
import 'package:sebenza/app/util/toast.dart';
import 'package:sebenza/app/widgets/helper_function.dart';



class ApiManger extends GetConnect {
  static var client = http.Client();

  static Uri uriPath({required String nameUrl}) {
    print("Url: ${AppConstants.baseURL}$nameUrl");
    return Uri.parse(AppConstants.baseURL + nameUrl);
  }



  loginResponse({required BuildContext context, email, password}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'email': Get.put(AuthController()).emailController.text,
        'password': Get.put(AuthController()).passController.text,
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


        // HelperFunctions.saveInPreference(
        //     "id", response.data['data']['id'].toString());
        //
        // HelperFunctions.saveInPreference(
        //     "name", response.data['data']['fullName'].toString());
        // HelperFunctions.saveInPreference(
        //     "email", response.data['data']['email'].toString());
        // HelperFunctions.saveInPreference(
        //     "phone", response.data['data']['phone'].toString());
        // HelperFunctions.saveInPreference(
        //     "address", response.data['data']['address'].toString());
        //
        // Get.offAll(() => HomeView(), transition: Transition.cupertinoDialog);
          Get.put(AuthController()).updateLoginLoader(false);
        flutterToast(msg: response.data["message"].toString());

        debugPrint(response.data.toString());
        debugPrint(response.data.toString());
      }
      else if(response.statusCode==201){
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


  loginAdminResponse({required BuildContext context, email, password}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'email': Get.put(AuthController()).emailController.text,
        'password': Get.put(AuthController()).passController.text,
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
          Get.back();
          Get.put(HomeController()).updateBasicLoader(false);
          Get.put(HomeController()).clear();



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
        Get.back();
        Get.put(HomeController()).updateBasicLoader(false);
        Get.put(HomeController()).clear();



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
        Get.back();
        Get.put(HomeController()).updateBasicLoader(false);
        Get.put(HomeController()).clear();



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
        Get.back();
        Get.put(HomeController()).updateBasicLoader(false);
        Get.put(HomeController()).clear();



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



}
