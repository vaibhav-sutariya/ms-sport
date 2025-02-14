import 'package:flutter/material.dart';
import 'package:ms_sport/res/colors.dart';
import 'package:ms_sport/view/car/car_screen.dart';
import 'package:ms_sport/view/dashboard/dashboard_screen.dart';
import 'package:ms_sport/view/messages/messages_screen.dart';
import 'package:ms_sport/view/profile/profile_screen.dart';
import 'package:ms_sport/view/trip/trip_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(),
    CarScreen(),
    MessagesScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navigate to TripScreen as a full page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TripScreen()),
      );
    } else if (index == 3) {
      // Navigate to ProfileScreen as a full page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else {
      // Update selected index for bottom bar screens
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: CustomNavBarClipper(),
            child: Container(
              height: 89,
              decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navBarItem(Icons.home, "Home", 0),
                  navBarItem(Icons.terrain, "Trips", 1),
                  SizedBox(width: 60), // Space for floating button
                  navBarItem(Icons.chat, "Chat", 2),
                  navBarItem(Icons.person, "Profile", 3),
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            child: FloatingActionButton(
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.orange,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              backgroundColor: AppColors.kPrimaryDark.withOpacity(0.9),
              child: Icon(
                Icons.directions_car,
                color: AppColors.kPrimary,
                size: 35,
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget navBarItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    final Color itemColor = isSelected ? AppColors.kWhite : AppColors.kBlack;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: itemColor),
          Text(label, style: TextStyle(color: itemColor)),
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = 15;
    Path path = Path();
    path.moveTo(0, curveHeight);
    path.quadraticBezierTo(size.width * 0.25, 0, size.width * 0.4, 0);
    path.arcToPoint(
      Offset(size.width * 0.6, 0),
      radius: Radius.circular(0),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.75, 0, size.width, curveHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
