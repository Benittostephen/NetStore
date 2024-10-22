import 'package:flutter/material.dart';
import 'package:nego_tube_login/constants/const.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;

  const MyTextfield(
      {super.key, required this.controller, required this.lableText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          hintText: lableText,
          hintStyle: TextStyle(color: primaryColor_300),
          filled: true,
          fillColor: primaryColor_50,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryColor_50, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   //borderSide: BorderSide.none,
          // ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //labelText: lableText,
          labelStyle: TextStyle(
            color: Color(0xFFF454545),
          )),
      //validator: validator,
    );
  }
}

// TextFormField _mytextfield(bool obscureText, TextEditingController controller,
//     String lableText, String? Function(String?) validator, prefixicon) {
//   return TextFormField(
//     controller: controller,
//     obscureText: obscureText,
//     decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFFf5f5f5),
//         suffixIcon: passwordController.text.isNotEmpty
//             ? (prefixicon)
//             ? IconButton(
//             icon: Icon(
//               size: 18,
//               color: Colors.grey,
//               _obscureText ? Icons.visibility_off : Icons.visibility,
//             ),
//             onPressed: _togglePasswordVisibility)
//             : null
//             : null,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(color: Color(0xFFFC6C6C6), width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(color: widget.appColor, width: 1),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5.0),
//           //borderSide: BorderSide.none,
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         labelText: lableText,
//         labelStyle: TextStyle(
//           color: Color(0xFFF454545),
//         )),
//     // autovalidateMode: AutovalidateMode.onUserInteraction,
//     validator: validator,
//   );
// }
