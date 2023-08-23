import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sebenza/app/services/api_manager.dart';
import 'package:sebenza/app/user_home/home/controller/user_controller.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_text.dart';

class ReplyTicketsAll extends StatefulWidget {
  ReplyTicketsAll({Key? key,this.data,this.type}) : super(key: key);
  var data;
  var type;

  @override
  State<ReplyTicketsAll> createState() => _ReplyTicketsAllState();
}

class _ReplyTicketsAllState extends State<ReplyTicketsAll> {
  final homeController = Get.put(UserController());
  TextEditingController messageController = TextEditingController();
  final picker = ImagePicker();


  handleChooseFromGallery() async {
    Navigator.pop(context);
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);
    setState(() async {
      if (image != null) {


        homeController.file2 = File(image.path);
        homeController.updateSendLoader(true);

        ApiManger().sendUserMessage(context: context,reply:"",
            id: homeController.updateId.value
        );
      } else {
        print('No image selected.');
      }
    });
  }

  handleTakePhoto() async {
    Navigator.pop(context);
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 40);
    setState(() async {
      if (image != null) {
        homeController.file2 = File(image.path);
        print("This is file ${homeController.file2}");
        homeController.updateSendLoader(true);

        ApiManger().sendUserMessage(context: context,reply:"",
        id: homeController.updateId.value
        );


      } else {
        print('No image selected.');
      }
    });
  }

  clearImage() {
    setState(() {});
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title:  AppText(
                title:"Select Option",
                size: AppSizes.size_16,
                overFlow: TextOverflow.ellipsis,
                color: AppColor.black,
                fontFamily: AppFont.medium),
            backgroundColor: AppColor.whiteColor,
            children: <Widget>[
              SimpleDialogOption(
                child: AppText(
                    title:"Camera",
                    size: AppSizes.size_15,
                    overFlow: TextOverflow.ellipsis,
                    color: AppColor.black,
                    fontFamily: AppFont.regular),
                onPressed: handleTakePhoto,
              ),
              SimpleDialogOption(
                child: AppText(
                    title:"Gallery",
                    size: AppSizes.size_15,
                    overFlow: TextOverflow.ellipsis,
                    color: AppColor.black,
                    fontFamily: AppFont.regular),
                onPressed: handleChooseFromGallery,
              ),

            ],
          );
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(UserController()).scrollController.animateTo(
        Get.put(UserController()).scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.secColor,
          body: Column(
            children: [
              Material(
                color: AppColor.primaryColor,
                elevation: 1,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 7.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.02,
                            vertical: Get.height * 0.018),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Get.back();
                                    },
                                    child: Container(
                                        color: Colors.transparent,

                                        child: Icon(Icons.arrow_back_ios,
                                          color: AppColor.white,
                                        )),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45.0,
                                          width: 45.0,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:widget.data.users.profile==null?
                                              "":widget.data.users.profile,
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (context, url, error) =>
                                                  ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.asset(
                                                      'assets/images/person.png',
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                              placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    color: AppColor.primaryColor,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.04),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                                title:widget.data.users.firstName??"",
                                                size: AppSizes.size_16,
                                                overFlow: TextOverflow.ellipsis,
                                                color: AppColor.whiteColor,
                                                fontFamily: AppFont.regular),
                                            SizedBox(height: Get.height*0.005,),
                                            SizedBox(
                                              width: Get.width*0.53,
                                              child: AppText(
                                                  title:"Subject: ${widget.data.subject??""}",
                                                  size: AppSizes.size_12,
                                                  maxLines: 1,
                                                  overFlow: TextOverflow.ellipsis,
                                                  color: AppColor.whiteColor.withOpacity(0.6),
                                                  fontFamily: AppFont.regular),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                           Container()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SingleChildScrollView(
                controller: homeController.scrollController,
                child: Column(children: [
                  Obx(
                          () {
                        return

                          ListView.builder(
                            shrinkWrap: homeController.ticketDetailList.isEmpty?true:true,
                            dragStartBehavior: DragStartBehavior.down,
                            itemCount: homeController.ticketDetailList.length,
                            primary: false,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            itemBuilder: (context, index) {

                              return


                                Row(
                                  mainAxisAlignment: homeController
                                      .ticketDetailList[index].type ==
                                      "User"
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 10,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          color: homeController
                                              .ticketDetailList[index].type ==
                                              "User"
                                              ? AppColor.primaryColor
                                              : AppColor.btnColor
                                              .withOpacity(.3),
                                          // AppColors.greyColor.withOpacity(.5),
                                          borderRadius: homeController
                                              .ticketDetailList[index].type ==
                                              "User"
                                              ? const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))
                                              : const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                              Radius.circular(10))),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          homeController
                                              .ticketDetailList[index].replayatt != null
                                              ? GestureDetector(
                                            onTap: () {

                                            },
                                            child: Container(
                                              height: 250,
                                              width: 200,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                homeController
                                                    .ticketDetailList[index].replayatt??"",
                                                fit: BoxFit.cover,
                                                placeholder: (context,
                                                    url) =>
                                                const Center(
                                                    child:
                                                    CircularProgressIndicator(
                                                      color: AppColor.btnColor,
                                                    )),
                                              ),
                                            ),
                                          )
                                              :
                                          SizedBox(
                                            width: homeController
                                                .ticketDetailList[index].replay.toString().length >27? 200:null,
                                            child: Text(
                                              homeController
                                                  .ticketDetailList[index].replay.toString(),
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  // color: AppColors.blackColor,
                                                  color: homeController
                                                      .ticketDetailList[index].type ==
                                                      "User"
                                                      ? Colors.white.withOpacity(0.7)
                                                      : Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: AppFont.regular
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            homeController
                                                .ticketDetailList[index].createdAt.toString(),
                                            style: TextStyle(
                                                fontSize: AppSizes.size_10,
                                                // color: AppColors.blackColor,
                                                color:  homeController
                                                    .ticketDetailList[index].type ==
                                                    "User"
                                                    ? Colors.white.withOpacity(0.7)
                                                    : Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: AppFont.regular
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                            },
                          );
                      }
                  ),
                  SizedBox(height: Get.height*0.07),

                ],),
              )),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: Get.height*0.015),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => selectImage(context),
                      child: Container(
                        height: 45.0,
                        width: 45.0,
                        decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor,
                            border: Border.all(color: AppColor.btnColor.withOpacity(0.7))
                        ),
                        child:  Center(
                          child: Icon(Icons.attach_file_sharp,
                              color: Colors.white.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.btnColor.withOpacity(0.7)
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: messageController,

                          onChanged: (v) {
                            setState(() {});
                          },
                          style: TextStyle(fontFamily: AppFont.regular, fontSize:  AppSizes.size_15,fontWeight: FontWeight.w500,
                            color:
                            AppColor.whiteColor,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 16.0,top: 1),
                            hintText: 'Type a message',
                            hintStyle:  TextStyle(
                              fontSize: 14.0,
                              color: AppColor.greyColor,
                              fontWeight: FontWeight.w500,
                            ),

                          ),

                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Obx(
                            () {
                          return
                            homeController.sendLoader.value
                                ? Center(
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColor.whiteColor,

                                  ),
                                ))
                                :


                            GestureDetector(
                              onTap:
                              messageController.text.isEmpty
                                  ? () {}
                                  :

                                  () {
                                homeController.updateSendLoader(true);

                                ApiManger().sendUserMessage(context: context,type: "User",reply: messageController.text,
                                    id: widget.data.id.toString()
                                );
                                messageController.clear();

                                setState(() {});

                              },
                              child: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: messageController.text.isNotEmpty
                                        ? AppColor.btnColor
                                        : AppColor.greyColors,
                                    border: Border.all(color:  messageController.text.isNotEmpty
                                        ? AppColor.btnColor
                                        : AppColor.greyColors,)
                                ),
                                child: Center(
                                  child: Icon(Icons.send,
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                              ),
                            );
                        }
                    ),

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.005,),
            ],
          ),
        ),
        Obx(() {
          return homeController.updateStatusTickets.value == false
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
}
