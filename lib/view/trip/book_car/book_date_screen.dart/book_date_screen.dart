import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/trip/book_car/book_date_screen.dart/widgets/calender_widget.dart';
import 'package:ms_sport/view/trip/book_car/book_date_screen.dart/widgets/time_picker_widget.dart';
import 'package:ms_sport/view/trip/book_car/check_out/check_out_screen.dart';
import 'package:ms_sport/view/trip/book_car/widgets/back_button_widget.dart';

class BookDateScreen extends StatefulWidget {
  const BookDateScreen({super.key});

  @override
  State<BookDateScreen> createState() => _BookDateScreenState();
}

class _BookDateScreenState extends State<BookDateScreen> {
  DateTime _selectedDate = DateTime.now();

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    log('Selected Date: ${DateFormat('yyyy-MM-dd').format(date)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Opacity(
                    opacity: 0.2, child: Image.asset('assets/images/car.png')),
                Positioned(
                  top: 40,
                  left: 20,
                  child: BackButtonWidget(),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Select Date',
                    style: TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  CalenderWidget(
                    selectedDate: _selectedDate,
                    onDateSelected: _onDateSelected,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Select Time',
                    style: TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TimePickerWidget(),
                  SizedBox(height: 10),
                  CustomElevatedButton(
                      text: 'Confirm',
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CheckOutScreen(),
                        ));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
