import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar(
      {required this.text, required this.isTrailing, required this.icon});

  final String text;
  final bool isTrailing;
  final IconData icon;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.kPrimaryDark,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ),
      ),
      actions: [
        isTrailing
            ? SizedBox(
                width: 56,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        icon,
                        size: 16,
                        color:
                            isTrailing ? AppColors.kPrimary : AppColors.kWhite,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
