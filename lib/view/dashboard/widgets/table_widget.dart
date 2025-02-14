import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.8),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(1.5),
      },
      children: [
        _buildTableRow(['Profile', 'Name', 'Mobile', 'Trip ID', 'Status'],
            isHeader: true),
        TableRow(
          children: List.generate(
            5, // Number of columns
            (index) => Divider(
              color: AppColors.kPrimary,
              thickness: 1,
              height: 1,
            ),
          ),
        ),
        TableRow(
          children: List.generate(
            5,
            (index) => SizedBox(height: 8),
          ),
        ),
        _buildTableRowWithAvatar('assets/images/user.png', 'Rajesh',
            '1234567891', 'ID45245', 'ON TRIP'),
        _buildTableRowWithAvatar('assets/images/user.png', 'Rajesh',
            '1234567891', 'ID45245', 'AVAILABLE'),
        _buildTableRowWithAvatar('assets/images/user.png', 'Rajesh',
            '1234567891', 'ID45245', 'LEAVE'),
        _buildTableRowWithAvatar('', '', '', '', ''),
        _buildTableRowWithAvatar('', '', '', '', ''),
        _buildTableRowWithAvatar('', '', '', '', ''),
        _buildTableRowWithAvatar('', '', '', '', ''),
        _buildTableRowWithAvatar('', '', '', '', ''),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? AppColors.kPrimaryDark : Colors.transparent,
      ),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            cell,
            style: TextStyle(
              color: AppColors.kWhite,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }

  TableRow _buildTableRowWithAvatar(String avatarPath, String name,
      String mobile, String tripId, String status) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: CircleAvatar(
            backgroundColor: AppColors.kPrimaryDark,
            radius: 15,
            backgroundImage:
                avatarPath.isNotEmpty ? AssetImage(avatarPath) : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.kWhite,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            mobile,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.kWhite,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            tripId,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.kWhite,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
            decoration: BoxDecoration(
              color: _getStatusColor(status),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: AppColors.kWhite,
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'ON TRIP':
        return Color(0xFF2EDE39);
      case 'AVAILABLE':
        return Color(0xFFFE9131);
      case 'LEAVE':
        return Color(0xFFFE728A);
      default:
        return AppColors.kPrimaryDark;
    }
  }
}
