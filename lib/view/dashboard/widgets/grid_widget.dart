import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Icon> icons = [
      Icon(Icons.people),
      Icon(Icons.person),
      Icon(Icons.person_add),
      Icon(Icons.how_to_reg),
      Icon(Icons.person_add),
    ];
    List<String> numbers = ['450', '155', '110', '1000', '110'];
    List<String> titles = [
      'Booked Trips',
      'Cancelled Trips',
      'New Trips',
      'Total Trips',
      'Rented Cars',
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.kPrimary,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icons[index].icon,
                color: AppColors.kWhite,
                size: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    numbers[index],
                    style: TextStyle(
                      color: AppColors.kPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    titles[index],
                    style: TextStyle(
                      color: AppColors.kWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
