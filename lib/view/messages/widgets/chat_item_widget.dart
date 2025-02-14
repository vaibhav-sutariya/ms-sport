import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/messages/chat/chat_screen.dart';

class ChatItem extends StatelessWidget {
  final String profileImage;
  final String name;
  final String message;
  final String time;
  final String remaining;
  final bool isOnline;
  final bool isRead;
  final bool isRemaining;

  ChatItem({
    required this.profileImage,
    required this.name,
    required this.message,
    required this.time,
    required this.remaining,
    required this.isOnline,
    required this.isRead,
    required this.isRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Chat Screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(text: name),
          ),
        );
      },
      child: Row(
        children: [
          // Profile Picture with Online Indicator
          Stack(
            children: [
              ClipOval(
                  child: SizedBox(
                      width: 55,
                      child: Image.asset('assets/images/$profileImage'))),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isOnline ? AppColors.kPrimary : Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.kWhite, width: 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),

          // Name & Message Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name
                Text(
                  name,
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                // Last Message
                Text(
                  message,
                  style: TextStyle(
                    color: AppColors.kPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Time & Read Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Read Status Icon & Time
              Row(
                children: [
                  Icon(
                    isRead ? Icons.done_all : Icons.done,
                    color: Colors.green,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Column(
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                          color: AppColors.kPrimary,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      isRemaining
                          ? Text(
                              remaining,
                              style: TextStyle(
                                color: AppColors.kPrimary,
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
