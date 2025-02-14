import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';

class AadharNumberWidget extends StatelessWidget {
  final TextEditingController aadharController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Text
        Text(
          "Aadhar number",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.kPrimary, // Label color
          ),
        ),
        const SizedBox(height: 8),

        // Aadhar Input Field
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              // Text Field
              TextField(
                controller: aadharController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "1234-5678-9128",
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),

              Divider(height: 1, color: Colors.grey),

              // Upload Button & Image Buttons Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    // Upload Aadhar Button
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.kBlack),
                      ),
                      child: Text(
                        'Upload Adhar Card',
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                    // const SizedBox(width: 6),

                    // Camera Icon Button
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt, color: Colors.orange),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 6),

                    // Front Image Button
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.kBlack,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.kBlack),
                      ),
                      child: Text(
                        'Front Image',
                        style: TextStyle(fontSize: 8, color: AppColors.kWhite),
                      ),
                    ),
                    const SizedBox(width: 6),

                    // Back Image Button
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.kBlack,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.kBlack),
                      ),
                      child: Text(
                        'Back Image',
                        style: TextStyle(fontSize: 8, color: AppColors.kWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
