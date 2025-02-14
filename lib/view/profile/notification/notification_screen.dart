import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          text: 'Notification', isTrailing: false, icon: Icons.abc),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Over Speeding',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kWhite),
                    ),
                    Text(
                      'High Speed Alert Feature',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.kWhite),
                    ),
                  ],
                ),
                CupertinoSwitch(
                  activeTrackColor: Colors.blue,
                  value: true,
                  onChanged: (value) {},
                )
              ],
            ),
            CustomElevatedButton(text: 'Change Setting', press: () {}),
          ],
        ),
      ),
    );
  }
}
