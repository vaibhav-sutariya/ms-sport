import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ms_sport/res/colors.dart';

class CalenderWidget extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalenderWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime _currentMonth = DateTime.now();

  void _changeMonth(int increment) {
    setState(() {
      _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month + increment, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 1);
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final startWeekday = firstDayOfMonth.weekday % 7;
    final days = List.generate(daysInMonth, (index) => index + 1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat.yMMMM().format(_currentMonth),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 18),
              onPressed: () => _changeMonth(-1),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18),
              onPressed: () => _changeMonth(1),
            ),
          ],
        ),
        // const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
              .map((day) => Expanded(
                    child: Center(
                      child: Text(day,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                    ),
                  ))
              .toList(),
        ),
        // const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: days.length + startWeekday,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            if (index < startWeekday) return const SizedBox.shrink();

            final day = days[index - startWeekday];
            DateTime currentDate =
                DateTime(_currentMonth.year, _currentMonth.month, day);
            bool isSelected = widget.selectedDate.day == day &&
                widget.selectedDate.month == _currentMonth.month &&
                widget.selectedDate.year == _currentMonth.year;

            return GestureDetector(
              onTap: () {
                widget.onDateSelected(currentDate);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.kPrimary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
