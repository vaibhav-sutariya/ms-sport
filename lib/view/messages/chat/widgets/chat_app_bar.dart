import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.text});
  final String text;
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.kPrimaryDark,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      title: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            'Active Now',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF19B000)),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.call_outlined, size: 16, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
