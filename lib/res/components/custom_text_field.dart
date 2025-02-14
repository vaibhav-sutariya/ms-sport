import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.focusNode,
    required this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
  });

  final String title;
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  void validate() {
    setState(() {
      errorText = widget.validator?.call(widget.controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kWhite, // Light background color
            borderRadius: BorderRadius.circular(12), // Rounded shape
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Subtle shadow effect
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            cursorColor:
                errorText != null ? AppColors.kError : AppColors.kPrimary,
            onSaved: widget.onSaved,
            onChanged: (value) {
              widget.onChanged?.call(value);
              validate();
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              fillColor: Colors.transparent, // Ensuring background matches
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.kPrimaryDark),
              border: InputBorder.none, // Removing standard borders
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorText!,
              style: TextStyle(color: AppColors.kError, fontSize: 12),
            ),
          ),
        SizedBox(height: 20),
      ],
    );
  }
}
