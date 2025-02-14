import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/view/trip/widgets/card_widget.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final List<String> _choices = ['All', 'Ongoing', 'Completed', 'Cancelled'];
  String _selectedChoice = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar(isTrailing: false, icon: Icons.car_rental, text: 'Trip'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _choices.map((choice) {
                    final bool isSelected = _selectedChoice == choice;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(
                          choice,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.kPrimaryDark
                                : AppColors.kWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        selected: isSelected,
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            _selectedChoice = choice;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: AppColors.kPrimary, width: 1),
                        ),
                        selectedColor:
                            AppColors.kPrimary, // Background when selected
                        backgroundColor:
                            AppColors.kPrimaryDark, // Default background
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              CardWidget(
                status: 'Completed',
                carName: 'BMW 3 Series',
                carType: 'Automatic',
                price: '1000',
                imageUrl: 'onboarding-first.png',
                isFavorite: true,
              ),
              CardWidget(
                status: 'Ongoing',
                carName: 'Mercedes E-Class',
                carType: 'Automatic',
                price: '1000',
                imageUrl: 'onboarding-second.png',
                isFavorite: false,
              ),
              CardWidget(
                status: 'Booked',
                carName: 'BMW GT',
                carType: 'Automatic',
                price: '1000',
                imageUrl: 'onboarding-third.png',
                isFavorite: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
