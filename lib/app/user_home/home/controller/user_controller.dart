import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/user_tabs/calendar/model/calendar_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/invoice/model/invoice_detail.dart';
import 'package:sebenza/app/user_home/home/user_tabs/invoice/model/invoice_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/orders/model/order_model.dart';
import 'package:sebenza/app/user_home/home/user_tabs/profile/model/user_model.dart';
import 'package:sebenza/app/widgets/helper_function.dart';

import '../user_tabs/ticket_systtem/model/ticket_user_model.dart';

class UserController extends GetxController {
  var id = "".obs;
  var tab = 0.obs;
  ScrollController scrollController = ScrollController();
  void scrollToLastMessage() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }
  File?file;
  File?file2;
  File?fileTicket;
  var meetingAllLoader = false.obs;
  var taskLoader = false.obs;
  var taskAllLoader = false.obs;
  var invoiceAllLoader = false.obs;
  var addTicketLoader = false.obs;
  var addCalLoader = false.obs;
  updateAddTicketLoader(val){
    addTicketLoader.value = val;
    update();


  }
  updateAddCalLoader(val){
    addCalLoader.value = val;
    update();


  }
  updateAllLoader(val){
    meetingAllLoader.value = val;
    update();


  }
  updateiNVOICELoader(val){
    invoiceAllLoader.value = val;
    update();


  }
  updateTaskAllLoader(val){
    taskAllLoader.value = val;
    update();


  }
  var meetingLoader = false.obs;
  var loaderTypeUser = false.obs;

  var phone = "".obs;
  var token = "".obs;
  var email = "".obs;
  var name = "".obs;
  var nameLast = "".obs;


  TextEditingController title = TextEditingController();
  TextEditingController link = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();


  TextEditingController taskName = TextEditingController();
  TextEditingController taskDetail = TextEditingController();
  TextEditingController taskDate = TextEditingController();
  TextEditingController taskTime = TextEditingController();


  TextEditingController amount = TextEditingController();
  TextEditingController notes = TextEditingController();



  TextEditingController subject = TextEditingController();
  TextEditingController ticketDes = TextEditingController();
  TextEditingController users = TextEditingController();



  TextEditingController eventName = TextEditingController();
  TextEditingController eventDetail = TextEditingController();
  TextEditingController eventStart = TextEditingController();
  TextEditingController eventEnd = TextEditingController();
  TextEditingController eventTime = TextEditingController();
  TextEditingController eventTimeEnd = TextEditingController();



  clear(){
    eventDetail.clear();
    eventEnd.clear();
    eventName.clear();
    eventStart.clear();
    eventTime.clear();
    eventTimeEnd.clear();
    title.clear();
    link.clear();
    des.clear();
    subject.clear();
    ticketDes.clear();
    date.clear();
    amount.clear();
    notes.clear();
    time.clear();
    users.clear();
    taskName.clear();
    taskDate.clear();
    taskTime.clear();
    taskDetail.clear();
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

      print(token.value.toString());
      getProfile();
      getTaskData();
      getMeetingData();
      getCalendarData();
      getOrderData();
      getTicketsData();
      getInvoiceData();
      getExpenseTypeData();
      getExpenseData();
      update();
    });



    super.onInit();
    getAnnounceData();
    //getHistoryData(id: "30746b29-8044-4c6b-aef8-f5cfdb584200");
  }

  var allMeetings = [].obs;

  getMeetingData() async {
    try {
      meetingLoader(true);
      update();

      var profData = await ApiManger.getMeeting();
      if (profData != null) {
        allMeetings.value = profData.data?.metings as dynamic;
        print(
            "This is meeetingss ${profData.data?.metings}");
      } else {
        meetingLoader(false);
        update();
      }
    } catch (e) {
      meetingLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      meetingLoader(false);
      update();
    }
    update();
  }

  var loaderBasicUser = false.obs;
  updateBasicLoader(val){
    loaderBasicUser.value = val;
    update();
  }

  var allTask = [].obs;

  getTaskData() async {
    try {
      taskLoader(true);
      update();

      var profData = await ApiManger.getTask();
      if (profData != null) {
        allTask.value = profData.data?.tasks as dynamic;
        print(
            "This is TASK ${profData.data?.tasks}");
      } else {
        taskLoader(false);
        update();
      }
    } catch (e) {
      taskLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      taskLoader(false);
      update();
    }
    update();
  }




  var invoiceList = <Invoices>[].obs;
  var invoiceLoader = false.obs;

  getInvoiceData() async {
    try {
      invoiceLoader(true);
      update();

      var profData = await ApiManger.getInvoice();
      if (profData != null) {
        invoiceList.value = profData.data?.invoices as dynamic;
        print(
            "This is invoice ${profData.data?.invoices}");
      } else {
        invoiceLoader(false);
        update();
      }
    } catch (e) {
      invoiceLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      invoiceLoader(false);
      update();
    }
    update();
  }





  var expenseList = [].obs;
  var expenseTypeLoader = false.obs;

  getExpenseData() async {
    try {
      expenseTypeLoader(true);
      update();

      var profData = await ApiManger.expenseModel();
      if (profData != null) {
        expenseList.value = profData.data?.expenses as dynamic;
        print(
            "This is invoice ${profData.data?.expenses}");
      } else {
        expenseTypeLoader(false);
        update();
      }
    } catch (e) {
      expenseTypeLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      expenseTypeLoader(false);
      update();
    }
    update();
  }





  var expenseTypeList = [].obs;

  getExpenseTypeData() async {
    try {

      update();

      var profData = await ApiManger.expenseType();
      if (profData != null) {
        expenseTypeList.value = profData.data?.expensetypes as dynamic;
        print(
            "This is invoice ${profData.data?.expensetypes}");
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



  var announceList = [].obs;
  var announceLoader = false.obs;

  getAnnounceData() async {
    try {
      announceLoader(true);
      update();

      var profData = await ApiManger.announceModel();
      if (profData != null) {
        announceList.value = profData.data?.news as dynamic;
        print(
            "This is invoice ${profData.data?.news}");
      } else {
        announceLoader(false);
        update();
      }
    } catch (e) {
      announceLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      announceLoader(false);
      update();
    }
    update();
  }





  var ticketList = <Supporttickets>[].obs;
  var ticketLoader = false.obs;

  getTicketsData() async {
    try {
      ticketLoader(true);
      update();

      var profData = await ApiManger.ticketUserModel();
      if (profData != null) {
        ticketList.value = profData.data?.supporttickets as dynamic;
        print(
            "This is tickets ${profData.data?.supporttickets}");
      } else {
        ticketLoader(false);
        update();
      }
    } catch (e) {
      ticketLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      ticketLoader(false);
      update();
    }
    update();
  }
  updateSendLoader(val){
    sendLoader.value = val;
    update();


  }
  var updateId = "".obs;
  updateIdData(val){
    updateId.value=val;
    update();
  }
  var updateStatusTickets = false.obs;
  var sendLoader = false.obs;
  updateTickLoader(val){
    updateStatusTickets.value = val;
    update();


  }
  var isDetailLoading = false.obs;
  var ticketDetailList = [].obs;

  getTicketDetailData({id}) async {
    try {
      isDetailLoading(true);
      update();

      var profData = await ApiManger.replyTicket(id: id);
      if (profData != null) {
        ticketDetailList.value = profData.data?.replays as dynamic;
        scrollToLastMessage();
        print(
            "This is gym ${profData.data?.replays}");
      } else {
        isDetailLoading(false);
        update();
      }
    } catch (e) {
      isDetailLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isDetailLoading(false);
      update();
    }
    update();
  }




  var isOrdersLoading = false.obs;
  Order ?  userOrderList ;

  getOrderData() async {
    try {
      isOrdersLoading(true);
      update();

      var profData = await ApiManger.getUserOrders();
      if (profData != null) {
        userOrderList = profData.data?.order ;

        print(
            "This is ORDER ${profData.data?.order}");
      } else {
        isOrdersLoading(false);
        update();
      }
    } catch (e) {
      isOrdersLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isOrdersLoading(false);
      update();
    }
    update();
  }




  var isCalendarLoading = false.obs;
  var calendarList = [].obs;

  getCalendarData() async {
    try {
      isCalendarLoading(true);
      update();

      var profData = await ApiManger.getCalendar();
      if (profData != null) {
        calendarList.value = profData.data?.calenders as dynamic;

      } else {
        isCalendarLoading(false);
        update();
      }
    } catch (e) {
      isCalendarLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isCalendarLoading(false);
      update();
    }
    update();
  }




  var isDetailInvoiceLoading = false.obs;
  InvoicesDetailModelAll ?  detailInvoice ;

  getInvoiceDetailData(id) async {
    try {
      isDetailInvoiceLoading(true);
      update();

      var profData = await ApiManger.getDetailInvoice(id:id.toString() );
      if (profData != null) {
        detailInvoice = profData.data?.invoices ;

        print(
            "This is invoices detail ${profData.data?.invoices}");
      } else {
        isDetailInvoiceLoading(false);
        update();
      }
    } catch (e) {
      isDetailInvoiceLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      isDetailInvoiceLoading(false);
      update();
    }
    update();
  }

  var image="".obs;
  updateImage(val) {
    image.value = val;
    update();
  }

  var profileLoading = false.obs;
  UserProfileData ?  userProfileData ;

  getProfile() async {
    try {
      profileLoading(true);
      update();

      var profData = await ApiManger.userProfileModel();
      if (profData != null) {
        userProfileData = profData.data;
        updateImage(profData.data?.user?.profile==null?"":profData.data?.user?.profile.toString());

        print(
            "This is profile data ${profData.data}");
      } else {
        profileLoading(false);
        update();
      }
    } catch (e) {
      profileLoading(false);
      update();
      debugPrint(e.toString());
    } finally {
      profileLoading(false);
      update();
    }
    update();
  }
}
