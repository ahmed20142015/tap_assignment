import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';

class TextFormFieldAtom extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  final InputDecoration? decoration;
  final Function(String?) onChanged;
  final Function(String?) onSaved;
  final Function()? onTapShowHidePassword;
  final String? Function(String?)? validator ;
  int maxLines;
  Widget? icon;
  String? suffixText;
  List<TextInputFormatter>? inputFormatters;
  TextFormFieldAtom(
      {Key? key,
      required this.hint,
      required this.onChanged,
      required this.onSaved,
      required this.inputType,
      this.validator,this.controller,
      this.obscureText = false,
      this.decoration,
        this.maxLines = 1,
        this.icon,
        this.suffixText,
      this.isHiddenPassword = false,
      this.obscuringCharacter = " ",
      this.onTapShowHidePassword,
        this.inputFormatters
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      cursorColor: Colors.black.withOpacity(.1),
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          fillColor:  Theme.of(context).cardColor,
          isDense: true,
          isCollapsed: true,
          filled: true,
          contentPadding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8).r,
          suffixIcon: icon,
          hintText: hint,
          suffixText: suffixText,
          hintStyle:  TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColor.mainTextColor,),
          suffixStyle:  TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColor.mainTextColor,),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.transparent, width: 0.0),),
        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:   BorderSide(color: Colors.transparent, width: 0.0),),
        focusedBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.transparent, width: 0.0),),
        errorBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.red, width: 1),),
        focusedErrorBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.red, width: 1),),
        disabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.transparent, width: 0.0),),

      ),

    );
    return TextFormField(
      controller: controller,
      onSaved: onChanged,
      validator: validator,
      cursorColor: Colors.black.withOpacity(.1),
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
      decoration: decoration??InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.transparent, width: 0.0),),
        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:   BorderSide(color: Colors.transparent, width: 0.0),),
        focusedBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.transparent, width: 0.0),),
        errorBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.red, width: 1),),
        focusedErrorBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.red, width: 1),),
        disabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24)),borderSide:  BorderSide(color: Colors.transparent, width: 0.0),),
        fillColor:const Color(0xffE5E5E5),
        filled: true,
        contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        suffixIcon: obscureText
            ? GestureDetector(
                onTap: onTapShowHidePassword,
                child: isHiddenPassword
                    ? const Icon(
                        Icons.visibility_off,
                        size: 24,
                        color: Color(0xff707070)
                      )
                    : const Icon(
                        Icons.visibility,
                        size: 24,
                        color: Color(0xff707070),
                      ),
              )
            : null,
      ),
    );
  }
}
