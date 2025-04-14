import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final Color? cursorColor;
  final Color? containerColor;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final BoxShadow? boxShadow;
  final bool obscureText;


  const CustomTextField({
    Key? key,
    this.labelText = '',
    this.obscureText=false,
    this.controller,
    this.textStyle,
    this.labelStyle,
    this.cursorColor,
    this.containerColor,
    this.fillColor,
    this.contentPadding,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor ?? AppColors.success,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          boxShadow ??
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 10.0,
                spreadRadius: 0.2,
                offset: Offset(0, 1),
              ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: textStyle ?? TextStyle(color: AppColors.black, fontSize: 14),
        cursorColor: cursorColor ?? AppColors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? AppColors.white,
          labelText: labelText,
          labelStyle: labelStyle ?? TextStyle(color: AppColors.gray, fontSize: 14),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: contentPadding ?? EdgeInsets.all(10),
        ),
      ),
    );
  }
}
