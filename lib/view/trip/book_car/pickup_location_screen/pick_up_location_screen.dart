import 'package:flutter/material.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/trip/book_car/pickup_location_screen/drop_location_screen.dart';
import 'package:ms_sport/view/trip/book_car/pickup_location_screen/widgets/address_card_widget.dart';
import 'package:ms_sport/view/trip/book_car/pickup_location_screen/widgets/search_widget.dart';

class PickUpLocationScreen extends StatelessWidget {
  const PickUpLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        icon: Icons.arrow_back,
        isTrailing: false,
        text: 'Pickup Location',
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 15,
              children: [
                SearchBarWidget(),
                AddressCard(
                  title: 'Home',
                  address: '4140parker Rd. Allentown, New Mexico 31134',
                  isSelected: true,
                ),
                AddressCard(
                  title: 'Work',
                  address: '4140parker Rd. Allentown, New Mexico 31134',
                  isSelected: false,
                ),
                AddressCard(
                  title: 'Office',
                  address: '4140parker Rd. Allentown, New Mexico 31134',
                  isSelected: false,
                ),
              ],
            ),
            CustomElevatedButton(
                text: 'Confirm',
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DropLocationScreen(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
