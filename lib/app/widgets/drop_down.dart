import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sebenza/app/util/theme.dart';
import 'package:sebenza/app/widgets/app_button.dart';


class SortedByDropDown extends StatelessWidget {
  final String hint;
  final String? value;
  final double fontSize;
  final double fontSize1;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final String fontFamily;
  final String fontFamily1;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color hintColor;

  SortedByDropDown({
    required this.hint,
    required this.value,
    this.fontFamily  ="regular",
    this.fontFamily1  ="medium",
    required this.dropdownItems,
    required this.onChanged,
    required this.hintColor ,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.fontSize  = 13,
    this.fontSize1  = 12,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return DropdownButtonHideUnderline(

      child: DropdownButton2(

        isExpanded: true,

        hint: Container(
          alignment: hintAlignment,
          child: Text(
              hint,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: hintColor,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: fontFamily,
                  fontSize: fontSize1
              )

          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Container(

            alignment: valueAlignment,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(

                    fontSize: fontSize,
                    color: Colors.grey,
                    fontFamily: fontFamily1,
                  )
              ),
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon:  SvgPicture.asset("assets/icons/downs.svg",height: Get.height*0.01,color: AppColor.borderColorField,),
        iconSize: iconSize ?? 15,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding:
        buttonPadding ?? const EdgeInsets.only(left: 6, right: 6),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,



            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ??  Get.height * 0.55,
        dropdownWidth: dropdownWidth ?? med.width * 0.3,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}




showAlertDialog(
    {required BuildContext context,
      required String text,
      required VoidCallback yesOnTap,
      bool isBoth = true}) {
  // set up the buttons
  Widget cancelButton = AppButton(
      buttonName: "Yes",
      buttonWidth: 100,
      buttonHeight: 40,
      buttonRadius: BorderRadius.circular(10),
      buttonColor: AppColor.primaryColor,
      textColor: Colors.black,
      onTap: yesOnTap);
  Widget continueButton = AppButton(
      buttonName: "No",
      buttonWidth: 100,
      buttonHeight: 40,
      buttonRadius: BorderRadius.circular(10),
      buttonColor: Colors.transparent,
      textColor: AppColor.black,
      borderColor: AppColor.primaryColor,
      onTap: () {
        Get.back();
      });
  AlertDialog alert = AlertDialog(
    content: Text(text,style: TextStyle(color: AppColor.black,fontFamily: AppFont.medium),),
    actions: [
      cancelButton,
      isBoth ? continueButton : Container(),
    ],
    actionsPadding: EdgeInsets.only(bottom: 10,right: 10,left: 10),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}