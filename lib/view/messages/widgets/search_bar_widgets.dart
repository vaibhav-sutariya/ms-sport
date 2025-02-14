import 'package:flutter/material.dart';

class SearchBarW extends StatelessWidget {
  const SearchBarW({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color similar to the image
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Places",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          prefixIcon: Icon(Icons.search_sharp, color: Colors.grey),
          suffixIcon: Icon(Icons.mic, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
