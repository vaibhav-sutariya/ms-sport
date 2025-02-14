import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

Widget buildUserMessage(String message, String time) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(12),
      constraints: BoxConstraints(maxWidth: 250),
      decoration: BoxDecoration(
        color: Color(0xFFE5F4FF),
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
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 4),
              Icon(Icons.done_all, color: Colors.green, size: 14),
            ],
          ),
        ],
      ),
    ),
  );
}
