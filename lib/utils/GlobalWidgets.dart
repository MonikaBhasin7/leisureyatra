import 'package:flutter/material.dart';
import 'package:travel_yatra/utils/ColorConstants.dart';

import 'TextStyles.dart';

TextFormField outlinedTextField(
    {required String labelText,
    required TextInputType? keyboardType,
    required TextEditingController? controller,
    Widget? prefixIcon,
    int? maxLength,
    int? height,
    Function()? onTapCallback}) {
  return TextFormField(
      onTap: () {
        if (onTapCallback != null) {
          onTapCallback();
        }
      },
      autofocus: false,
      keyboardType: keyboardType,
      maxLength: maxLength,
      controller: controller,
      style:
          textStyleWithSizeColorWeight(20.0, tvHeadingColor, FontWeight.w500),
      //initialValue: _innerCardItem?.rechargeAmount != null ? _innerCardItem?.rechargeAmount.toString() : "0",
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary_color, width: 3.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelText: labelText,
          contentPadding: (height == null)
              ? null
              : EdgeInsets.symmetric(vertical: height.toDouble()),
          labelStyle: textStyleWithSizeColorWeight(
              20.0, tvHeadingColor, FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          //prefix: Padding(padding: EdgeInsets.only(right: 10),child: SvgPicture.asset("assets/svg/ic_rupee_icon.svg")),
          prefixIcon: prefixIcon));
}
