
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/services/api_manager.dart';

class AuthController extends GetxController {
  var isVisible = true.obs;
  var roleTypeName="".obs;
  updateRoleName(val){
    roleTypeName.value=val;
    update();

  }
  var type = "Customer".obs;
  updateTypeValue(value) {
    type.value = value;
    update();
  }
  var isVisible1 = true.obs;
  var isVisible2 = true.obs;
  var accountType="".obs;
  var userType="".obs;
  updateVisibleStatus() {
    isVisible.toggle();
    update();
  }
  updateLoader(val){
    loader.value = val;
    update();


  }
  updateOtp(val){
    otp.value = val;
    update();


  }
  updateLoginLoader(val){
    loaderLogin.value = val;
    update();


  }
  var loader = false.obs;
  var otp = false.obs;
  var loaderLogin = false.obs;
  updateUserType(val){

    accountType.value = val;
    update();
  }

  updateUsersType(val){
    userType.value = val;
    update();
  }

  updateVisible1Status() {
    isVisible1.toggle();
    update();
  }
  updateVisible2Status() {
    isVisible2.toggle();
    update();
  }

  var lat="".obs;
  var lng="".obs;
  updateLat(val){
    lat.value=val;
    update();

  }
  updateLng(val){
    lng.value=val;
    update();

  }
  @override
  Future<void> onInit() async {
    super.onInit();
    getAccountData();
  }

  var allAccountList = [].obs;
  var accountTypeAll;
  getAccountData() async {
    try {

      update();

      var profData = await ApiManger.allAccountTickets();
      if (profData != null) {
        allAccountList.value = profData.data?.accounttypes as dynamic;
        print(
            "This is gym ${profData.data?.accounttypes}");
      } else {

        update();
      }
    } catch (e) {

      update();
      debugPrint(e.toString());
    } finally {

      update();
    }
    update();
  }



  TextEditingController emailRegController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController counNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController maxNameController = TextEditingController();
  TextEditingController passRegController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  RxBool isCheck = false.obs;
  updateCheck(val) {
    isCheck.value = val;
    update();
  }

  RxBool isCheck2 = false.obs;
  updateCheck2(val) {
    isCheck2.value = val;
    update();
  }

  clear(){
    updateRoleName("");
    accountTypeAll=null;
    emailRegController.clear();

    firstNameController.clear();
    lastNameController.clear();
    cityNameController.clear();
    counNameController.clear();
    addressController.clear();
    maxNameController.clear();
    addressController.clear();

    passRegController.clear();
    phoneController.clear();
    addressController.clear();
    updateUserType("");
    updateLng("");
    updateLat("");
  }

}