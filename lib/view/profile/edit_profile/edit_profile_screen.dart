import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/profile/edit_profile/widgets/adhar_widget.dart';
import 'package:ms_sport/view/profile/edit_profile/widgets/field_col_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController adharController = TextEditingController();
    return Scaffold(
      appBar:
          CustomAppbar(text: 'Profile', isTrailing: false, icon: Icons.done),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage(
                      'assets/images/user.png',
                    ),
                  ),
                  Text(
                    'User Profile',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhite),
                  ),
                  Text('Add or Edit profile',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimary)),
                  SizedBox(
                    height: 10,
                  ),
                  FieldColWidget(
                    title: 'Name',
                    hintText: 'user name',
                    Controller: usernameController,
                  ),
                  FieldColWidget(
                    title: 'Email',
                    hintText: 'user123@gmail.com',
                    Controller: emailController,
                  ),
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kPrimary),
                      ),
                      IntlPhoneField(
                        controller: phoneController,
                        flagsButtonPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        dropdownIconPosition: IconPosition.trailing,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors
                              .kWhite, // Light background for input field
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ],
                  ),
                  AadharNumberWidget(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              CustomElevatedButton(text: 'Update profile', press: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
