import 'package:flutter/material.dart';
import '../config/consts/app_color.dart';

class InputTextField extends StatelessWidget{
  String? labelText;
  String hintText;
  bool obscureText;
  TextEditingController controller;

  InputTextField({super.key,
    this.labelText,
    required this.hintText,
    this.obscureText=false,
    required this.controller,
});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.inputColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.inputColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.inputColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.inputColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: AppColor.inputColor,
      ),
    );
  }
}