import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/profile/chnage_password/change_password_screen.dart';
import 'package:ms_sport/view/profile/edit_profile/edit_profile_screen.dart';
import 'package:ms_sport/view/profile/notification/notification_screen.dart';
import 'package:ms_sport/view/profile/widget/list_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isTrailing: true,
        icon: Icons.create_outlined,
        text: 'Profile',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage(
                      'assets/images/user.png',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Imane fh',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kWhite),
                  ),
                  Text('imanefh28@gmail.com',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimary)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTileWidget(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                        },
                        icon: Icons.person_2_outlined,
                        name: 'Profile'),
                    ListTileWidget(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen(),
                            ),
                          );
                        },
                        icon: Icons.bookmark_outline,
                        name: 'Change Password'),
                    ListTileWidget(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                        icon: Icons.travel_explore_outlined,
                        name: 'Notification'),
                    SizedBox(height: 150),
                  ],
                ),
              ),
              CustomElevatedButton(
                  text: 'Logout', press: () => _showLogoutDialog(context)),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Logout Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 24, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Are you sure want to logout your account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                    text: 'Logout',
                    press: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
