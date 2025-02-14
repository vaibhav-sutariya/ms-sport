import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/view/messages/widgets/chat_item_widget.dart';
import 'package:ms_sport/view/trip/book_car/pickup_location_screen/widgets/search_widget.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          icon: Icons.more_vert, isTrailing: true, text: 'Messages'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kPrimary,
                  ),
                ),
                Icon(
                  Icons.edit_square,
                  color: AppColors.kPrimary,
                ),
              ],
            ),
            SizedBox(height: 20),
            SearchBarWidget(),
            SizedBox(height: 20),
            ChatItem(
              profileImage: 'user.png',
              isOnline: true,
              isRead: false,
              name: 'Ahmed anjims',
              message: 'hi, John! How are you doing?',
              time: '09:46',
              isRemaining: false,
              remaining: '',
            ),
            SizedBox(height: 20),
            ChatItem(
              profileImage: 'user.png',
              isOnline: false,
              isRead: true,
              name: 'alem leain',
              message: 'Typing....',
              time: '08:4',
              isRemaining: true,
              remaining: '2',
            )
          ],
        ),
      ),
    );
  }
}
