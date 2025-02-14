import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/onboarding/components/custom_dots_indicator.dart';
import 'package:ms_sport/view/trip/book_car/book_date_screen.dart/book_date_screen.dart';
import 'package:ms_sport/view/trip/book_car/widgets/back_button_widget.dart';
import 'package:ms_sport/view/trip/book_car/widgets/car_details_widget.dart';

class BookCarScreen extends StatelessWidget {
  const BookCarScreen({
    super.key,
    required this.imageUrl,
    required this.carName,
  });
  final String imageUrl;
  final String carName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/car.png'),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: BackButtonWidget(),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    left: 10,
                    child: CustomDotsIndicator(
                      dotsCount: 3,
                      position: 0,
                      color: AppColors.kPrimaryDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carName + ' - 2024',
                      style: TextStyle(
                        color: AppColors.kPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have sufferedalteration in some form, by injected humour.',
                      style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Car Details',
                      style: TextStyle(
                        color: AppColors.kPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CarDetailsWidget(left: 'vehical Type', right: 'Sedan'),
                    CarDetailsWidget(left: 'Fuel Type', right: 'Diesel'),
                    CarDetailsWidget(left: 'Interior Color', right: 'Black'),
                    CarDetailsWidget(left: 'Kilometers', right: '2000'),
                    CarDetailsWidget(left: 'Seats', right: '4'),
                    CarDetailsWidget(left: 'Transmission', right: 'Automatic'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carName + ' - 2024',
                      style: TextStyle(
                        color: AppColors.kPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\u{20B9} ${15000}/day',
                      style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(141, 48),
                    backgroundColor: AppColors.kPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDateScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Rent Car',
                    style: TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }
}
