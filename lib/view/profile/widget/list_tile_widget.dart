// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              icon,
              color: Colors.grey,
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 15,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.1,
          ),
        ],
      ),
    );
  }
}
