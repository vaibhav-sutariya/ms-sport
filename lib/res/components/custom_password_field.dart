import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
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
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscured = true;
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
            color: AppColors.kWhite, // Light background
            borderRadius: BorderRadius.circular(12), // Rounded design
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Subtle shadow
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
            obscureText: isObscured,
            onSaved: widget.onSaved,
            onChanged: (value) {
              widget.onChanged?.call(value);
              validate();
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              fillColor: Colors.transparent,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.kPrimaryDark),
              border: InputBorder.none, // Removing standard borders
              suffixIcon: IconButton(
                icon: Icon(
                  isObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.kPrimaryDark,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
              ),
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
        SizedBox(height: 15),
      ],
    );
  }
}
