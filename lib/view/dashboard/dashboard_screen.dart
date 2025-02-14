import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/dashboard/widgets/grid_widget.dart';
import 'package:ms_sport/view/dashboard/widgets/table_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryDark,
        iconTheme: const IconThemeData(color: AppColors.kWhite),
        leading: const Icon(Icons.menu),
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: 18, color: AppColors.kWhite),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/user.png',
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Grid Widget with proper height
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: GridWidget(),
              ),
              const SizedBox(height: 16),

              // Trip Table
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.kPrimary,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 8,
                      ),
                      child: Text(
                        'Trip Info',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.kPrimary,
                      thickness: 1,
                    ),
                    TableWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build table rows
}
