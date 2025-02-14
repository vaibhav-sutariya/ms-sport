// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_text_field.dart';

class FieldColWidget extends StatelessWidget {
  FieldColWidget({
    Key? key,
    required this.title,
    required this.hintText,
    required this.Controller,
  }) : super(key: key);
  final String title;
  final String hintText;
  FocusNode focusNode = FocusNode();
  final TextEditingController Controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.kPrimary),
        ),
        CustomTextField(
          title: title,
          hintText: hintText,
          focusNode: focusNode,
          controller: Controller,
        )
      ],
    );
  }
}
