import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

Widget buildReceivedMessage(String message, String time, String profileUrl) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 18, backgroundImage: NetworkImage(profileUrl)),
        SizedBox(width: 8),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: TextStyle(fontSize: 14, color: AppColors.kBlack),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(time,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7D848D),
                          fontWeight: FontWeight.w900)),
                  SizedBox(width: 4),
                  Icon(Icons.done_all, color: Colors.green, size: 14),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
