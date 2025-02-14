import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/trip/book_car/book_car_screen.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.status,
    required this.carName,
    required this.carType,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  final String status;
  final String carName;
  final String carType;
  final String price;
  final bool isFavorite;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 4,
      child: GestureDetector(
        onTap: () {
          log('CardWidget onTap');
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookCarScreen(
              imageUrl: imageUrl,
              carName: carName,
            ),
          ));
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Car Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset('assets/images/$imageUrl',
                        width: 228, height: 128, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 8.0),

                  // Car Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            carName,
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.kPrimaryDark,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            carType,
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColors.kBlack,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kPrimary,
                            ),
                          ),
                          const Text(
                            "/day",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kBlack),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Status Badge
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),

            // Heart (Favorite) Icon
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryDark.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.pink,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
