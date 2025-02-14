import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/trip/book_car/check_out/widget/person_details.dart';
import 'package:ms_sport/view/trip/book_car/pickup_location_screen/pick_up_location_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        icon: Icons.arrow_back,
        isTrailing: false,
        text: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kPrimary,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bmw 3 Series - 2024',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kWhite,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\u{20B9} ${1600}/',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kPrimary,
                                ),
                              ),
                              Text(
                                'day',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kWhite,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Ahmedabad, Feb26-28',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kWhite,
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/images/car.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'RENTER INFORMATION',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kWhite,
                    ),
                  ),
                  SizedBox(height: 5),
                  PersonDetails(
                      isPrice: false,
                      left: 'Full Name',
                      right: 'Dharmik Yadav'),
                  PersonDetails(
                      isPrice: false,
                      left: 'Address Line',
                      right: 'Vastrapur, Ahmedabad'),
                  PersonDetails(
                      isPrice: false,
                      left: 'Mobile Number',
                      right: '1234567891'),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                          checkColor: AppColors.kPrimary,
                          value: false,
                          onChanged: (value) {}),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Terms and Condition',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kWhite,
                              ),
                            ),
                            Text(
                              'In addition to the vehicle are the following is \nincluded in the car rental: All tires, tools, doc\numents, accessories as well as equipment.\nThe renter agrees to all conditions and terms',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.kWhite,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discount',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimary,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomElevatedButton(
                    color: AppColors.kWhite,
                    text: 'Use a Promo code',
                    press: () {},
                  ),
                  SizedBox(height: 10),
                  Text(
                    'PRICE DETAILS',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimary,
                    ),
                  ),
                  PersonDetails(
                      isPrice: true,
                      left: 'Trip price',
                      right: '\u{20B9} ${16000}'),
                  PersonDetails(
                      isPrice: true,
                      left: 'Discount',
                      right: '\u{20B9} ${1000}'),
                  Row(
                    children: List.generate(
                        1000 ~/ 10,
                        (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : AppColors.kPrimary,
                                height: 1,
                              ),
                            )),
                  ),
                  PersonDetails(
                      isPrice: true, left: 'Total', right: '\u{20B9} ${15000}'),
                  SizedBox(height: 30),
                  CustomElevatedButton(
                    text: 'Continue',
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PickUpLocationScreen(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
