import 'package:flutter/material.dart';

class ChooseCategory extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ChooseCategory({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color(0xFFFC6C6C6), // Change this to your desired color
              width: 1.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 14.0, color: Color(0xFFF454545)),
        ),
      ),
    );
  }
}
