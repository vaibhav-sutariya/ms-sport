import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/res/components/custom_appbar.dart';
import 'package:ms_sport/res/components/custom_elevated_button.dart';
import 'package:ms_sport/view/trip/book_car/last_screen/last_screen.dart';
import 'package:ms_sport/view/trip/book_car/payment_screen.dart/widgets/payment_logo.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = "Stripe Payment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar(isTrailing: false, icon: Icons.payment, text: 'Payment'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 350,
              // padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF6B4F35), // Brownish background color
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stripe Payment Option
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = "Stripe Payment";
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          activeColor: AppColors.kPrimary,
                          fillColor:
                              WidgetStateProperty.all(AppColors.kPrimary),
                          value: "Stripe Payment",
                          groupValue: selectedPayment,
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Stripe Payment",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Payment Logos
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        PaymentLogo("assets/logo/logos_visa.png"),
                        SizedBox(width: 6),
                        PaymentLogo("assets/logo/mastercard.png"),
                        SizedBox(width: 6),
                        PaymentLogo("assets/logo/Paytm.png"),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),

                  // Description Box
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color:
                          Color(0xFFE0DCD5), // Light brownish-gray background
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.web,
                            size: 100,
                            color: AppColors.kPrimaryDark
                                .withOpacity(0.2)), // Web icon
                        SizedBox(height: 8),
                        Text(
                          'After clicking "Completed order", you will be redirected to Cashfree to complete your purchase securely.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kBlack,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: 12),

                  // Cash on Delivery Option
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = "Cash on Delivery";
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.orange,
                          fillColor:
                              WidgetStateProperty.all(AppColors.kPrimary),
                          value: "Cash on Delivery",
                          groupValue: selectedPayment,
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Cash on Delivery (COD)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
                text: 'Confirm',
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LastScreen(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
