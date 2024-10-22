// import 'package:flutter/material.dart';
//
// class OtpVerificationScreen extends StatelessWidget {
//   const OtpVerificationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

import 'package:flutter/material.dart';
import 'package:nego_tube_login/constants/const.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  // This method verifies the OTP
  void _verifyOTP(BuildContext context) {
    final otp = _otpController.text;
    if (otp.length == 6) {
      // Logic to verify OTP
      print("Entered OTP: $otp");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('OTP Verified')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid OTP')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
          color: primaryColor_50, // Light grey box color from screenshot
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.transparent)),
    );

    // Focused pin theme (Red border when selected)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: primaryColor_50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor),
      ),
    );

    return /*Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BodyText(headingText: 'Verify OTP'),
            PinCodeTextField(
              enableActiveFill: true,
              keyboardType: TextInputType.phone,
              appContext: context,
              length: 5,
              controller: otpController,
              onChanged: (value) {
                if (value.length == 5) {
                  verifyOtp;
                }
              },
              pinTheme: PinTheme(
                activeColor: Colors.green,
                inactiveFillColor: const Color(0xffeeedec),
                activeFillColor: const Color(0xffeeedec),
                selectedFillColor: const Color(0xffeeedec),
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10.0),
                fieldHeight: 59,
                fieldWidth: 58,
                selectedColor: const Color(0xFFD5715B),
                inactiveColor: const Color(0xffeeedec),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(buttonName: 'Submit', onTap: verifyOtp),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: resendOtp,
                child: const Text('Resend Code',
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );*/
        Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('OTP Verification'),
        leading: const Icon(Icons.arrow_back_ios),
        titleSpacing: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            //     flex: 1,
            //     child: Column(
            //       children: [Text('data')],
            //     )),
            // Expanded(
            //     flex: 2,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(50)),
            //         color: Colors.red,
            //       ),
            //       width: double.maxFinite,
            //       // color: Colors.red,
            //       child: Column(
            //         children: [Text('data')],
            //       ),
            //     ))
            Text(
              'Enter the 6-digit OTP sent to your number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Pinput(
              length: 6,
              controller: _otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              onCompleted: (pin) => _verifyOTP(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _verifyOTP(context),
              // Use context to show SnackBar
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

//
//
// class OtpVerificationScreen extends StatelessWidget {
//   final TextEditingController _otpController = TextEditingController();
//
//   void _verifyOTP(BuildContext context) {
//     final otp = _otpController.text;
//     if (otp.length == 6) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('OTP Verified')));
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Invalid OTP')));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Default pin theme
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//         fontSize: 22,
//         color: Colors.black,
//         fontWeight: FontWeight.w600,
//       ),
//       decoration: BoxDecoration(
//         color: Color(0xFFF2F2F2), // Light grey box color from screenshot
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//       ),
//     );
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 40),
//             // App Name / Logo
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "FarmerEats", // Add your logo or app name here
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//             // Heading
//             Text(
//               "Verify OTP",
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 8),
//             // Subtitle and Login option
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Remember your password?",
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Add navigation to Login page if necessary
//                   },
//                   child: Text(
//                     "Login",
//                     style: TextStyle(color: Color(0xFFE06C5F)),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 40),
//             // Pinput widget
//             Pinput(
//               length: 6,
//               controller: _otpController,
//               defaultPinTheme: defaultPinTheme,
//               pinAnimationType: PinAnimationType.scale,
//               showCursor: true,
//               onCompleted: (pin) => _verifyOTP(context),
//             ),
//             SizedBox(height: 40),
//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFFE06C5F), // Button color
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25), // Rounded button
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 onPressed: () => _verifyOTP(context),
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Resend Code Link
//             GestureDetector(
//               onTap: () {
//                 // Add logic to resend OTP
//               },
//               child: Text(
//                 "Resend Code",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black87,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
