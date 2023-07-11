import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/model/get_user_model.dart';
import 'package:sebenza/app/admin/admin_home/home_tabs/user/model/roles_model.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/widgets/helper_function.dart';

class HomeController extends GetxController {
  var id = "".obs;
  var name = "".obs;
  File ? basicFile;

  var roleTypeAll;
  updateRollAll(val){
    roleTypeAll=val;
    update();
  }
  var roleTypeName="".obs;
  updateRoleName(val){
    roleTypeName.value=val;
    update();

  }
  var nameLast = "".obs;
  var loaderUser = false.obs;
  var loaderUpdatesUser = false.obs;
  var loaderBasicUser = false.obs;
  var loaderTypeUser = false.obs;
  updateUserLoader(val){
    loaderUser.value = val;
    update();


  }
  updateAllLoader(val){
    loaderUpdatesUser.value = val;
    update();


  }
  updateUserTypeLoader(val){
    loaderTypeUser.value = val;
    update();
  }
  updateBasicLoader(val){
    loaderBasicUser.value = val;
    update();
  }
  updateName(val){
    name.value=val;
    update();
  }

  var selectName=[].obs;

  updatePhone(val){
    phone.value=val;
    update();
  }
  var phone = "".obs;
  var token = "".obs;
  var email = "".obs;

  File? file;
  File? file1;
  var isVisible = true.obs;
  var isVisible1 = true.obs;
  var isVisible2 = true.obs;
  var userType="".obs;
  var status="".obs;
  var status1="".obs;
  updateStatus(val){
    status.value=val;
  }
  updateStatus1(val){
    status1.value=val;
  }
  var roleType;
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  TextEditingController pixController = TextEditingController();
  TextEditingController analyticsController = TextEditingController();
  TextEditingController metaNameController = TextEditingController();
  TextEditingController metDesController = TextEditingController();
  TextEditingController metKeyWordsController = TextEditingController();
  TextEditingController emailRegController = TextEditingController();
  TextEditingController emailBasicController = TextEditingController();
  TextEditingController titleBasicController = TextEditingController();
  TextEditingController contactBasicController = TextEditingController();
  TextEditingController addressBasicController = TextEditingController();
  TextEditingController roleRegController = TextEditingController();
  TextEditingController accountTypeName = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController counNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController maxNameController = TextEditingController();
  TextEditingController passRegController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController faceController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController pintController = TextEditingController();
  TextEditingController googleController = TextEditingController();
  TextEditingController tikController = TextEditingController();
  TextEditingController rssController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController youController = TextEditingController();
  TextEditingController twitController = TextEditingController();


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
    pixController.clear();
    faceController.clear();
    instaController.clear();
    pintController.clear();
    googleController.clear();
    tikController.clear();
    rssController.clear();
    linkController.clear();
    youController.clear();
    twitController.clear();
    analyticsController.clear();
    emailRegController.clear();
    emailBasicController.clear();
    titleBasicController.clear();
    contactBasicController.clear();
    metKeyWordsController.clear();
    metDesController.clear();
    metaNameController.clear();
    addressBasicController.clear();
    firstNameController.clear();
    roleRegController.clear();
    lastNameController.clear();
    accountName.clear();
    whatsapp.clear();
    updateStatus1("");
    title.clear();
    des.clear();
    file1=null;
    file=null;

    companyNameController.clear();
    cityNameController.clear();
    counNameController.clear();
    addressController.clear();
    maxNameController.clear();
    accountTypeName.clear();
    updateStatus("");
    basicFile=null;
    addressController.clear();
    updateRoleName("");
    roleTypeAll=null;

    passRegController.clear();
    phoneController.clear();
    addressController.clear();
    updateUserType("");
    updateLng("");
    updateLat("");
  }


  @override
  Future<void> onInit() async {

    HelperFunctions.getFromPreference("id").then((value) {
      id.value = value;


      update();
    });
    HelperFunctions.getFromPreference("name").then((value) {
      name.value = value;
      print(name.value.toString());

      update();
    });
    HelperFunctions.getFromPreference("nameLast").then((value) {
      nameLast.value = value;
      print(nameLast.value.toString());

      update();
    });
    HelperFunctions.getFromPreference("email").then((value) {
      email.value = value;

      update();
    });
    HelperFunctions.getFromPreference("phone").then((value) {
      phone.value = value;

      update();
    });
    HelperFunctions.getFromPreference("token").then((value) {
      token.value = value;
     getUserData(search: "");
      getRolesData();
      getUserRolesData(id: "");
      getAccountData(search: "");
      getWhatsaData(search: "");
      getUpdatesData();
      getBasicData();
      print(token.value.toString());
      update();
    });



    super.onInit();
    //getHistoryData(id: "30746b29-8044-4c6b-aef8-f5cfdb584200");
  }

  var userList = <Users>[].obs;
  var rolesList = <RolesModelAll>[].obs;
  var data;

  var emailBasic="".obs;
  updateEmail(val){
    emailBasic.value=val;
    update();
  }
  var accountList = [].obs;
  var userRolList = [].obs;
  var userWhatsList = [].obs;
  var updatesList = [].obs;
  var isLoading = false.obs;
  var isRolLoading = false.obs;
  var isAccountLoading = false.obs;
  var isWhatsappLoading = false.obs;
  var isUpdatesLoading = false.obs;
  getUserData({search}) async {
    try {
      isLoading(true);
      update();

      var profData = await ApiManger.getUserModel(search: search);
      if (profData != null) {
        userList.value = profData.data?.users as dynamic;
        print(
            "This is gym ${profData.data?.users?.length}");
      } else {
        isLoading(false);
        update();
      }
    } catch (e) {
      isLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isLoading(false);
      update();
    }
    update();
  }




  getUpdatesData() async {
    try {
      isUpdatesLoading(true);
      update();

      var profData = await ApiManger.getUpdates();
      if (profData != null) {
        updatesList.value = profData.data?.news as dynamic;
        print(
            "This is gym ${profData.data?.news?.length}");
      } else {
        isUpdatesLoading(false);
        update();
      }
    } catch (e) {
      isUpdatesLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isUpdatesLoading(false);
      update();
    }
    update();
  }




  getWhatsaData({search}) async {
    try {
      isWhatsappLoading(true);
      update();

      var profData = await ApiManger.getWhatsapp(id: search);
      if (profData != null) {
        userWhatsList.value = profData.data?.whatsapp as dynamic;
        print(
            "This is gym ${profData.data?.whatsapp?.length}");
      } else {
        isWhatsappLoading(false);
        update();
      }
    } catch (e) {
      isWhatsappLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isWhatsappLoading(false);
      update();
    }
    update();
  }



  getAccountData({search}) async {
    try {
      isAccountLoading(true);
      update();

      var profData = await ApiManger.getAccount(id: search);
      if (profData != null) {
        accountList.value = profData.data?.accounttypes as dynamic;
        print(
            "This is gym ${profData.data?.accounttypes?.length}");
      } else {
        isAccountLoading(false);
        update();
      }
    } catch (e) {
      isAccountLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isAccountLoading(false);
      update();
    }
    update();
  }


  getRolesData() async {
    try {


      var profData = await ApiManger.getUserRoles();
      if (profData != null) {
        rolesList.value = profData.data?.roles as dynamic;
        print(
            "This is gym ${profData.data?.roles?.length}");
      } else {

      }
    } catch (e) {

      debugPrint(e.toString());
    } finally {

    }
    update();
  }



  getBasicData() async {
    try {


      var profData = await ApiManger.getBasicModel();
      if (profData != null) {
        data = profData.data?.basicinfo;
        updateEmail(profData.data?.basicinfo?.email==null?"":profData.data?.basicinfo?.email);
        print(
            "This is basic info ${profData.data?.basicinfo?.address}");
      } else {

      }
    } catch (e) {

      debugPrint(e.toString());
    } finally {

    }
    update();
  }




  getUserRolesData({id}) async {
    try {
      isRolLoading(true);
      update();

      var profData = await ApiManger.rolesModel(id: id);
      if (profData != null) {
        userRolList.value = profData.data?.roles as dynamic;
        print(
            "This is gym ${profData.data?.roles?.length}");
      } else {
        isRolLoading(false);
        update();
      }
    } catch (e) {
      isRolLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isRolLoading(false);
      update();
    }
    update();
  }

}
