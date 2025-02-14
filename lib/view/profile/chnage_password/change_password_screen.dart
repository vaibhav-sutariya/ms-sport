import 'package:flutter/material.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/profile/chnage_password/widgets/field_name_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: CustomAppbar(
          text: 'Change Password',
          isTrailing: false,
          icon: Icons.arrow_back_ios),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                FieldNameWidget(
                  title: 'Old Password',
                  hintText: 'old password',
                  Controller: oldPasswordController,
                ),
                FieldNameWidget(
                  title: 'New Password',
                  hintText: 'New password',
                  Controller: newPasswordController,
                ),
                FieldNameWidget(
                  title: 'Retype new Password',
                  hintText: 'Retype new password',
                  Controller: newPasswordController,
                ),
              ],
            ),
            CustomElevatedButton(text: 'Change password', press: () {}),
          ],
        ),
      ),
    );
  }
}
