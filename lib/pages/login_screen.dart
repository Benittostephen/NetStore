import 'package:flutter/material.dart';
import 'package:nego_tube_login/constants/const.dart';
import 'package:nego_tube_login/pages/otp_verification_screen.dart';
import 'package:nego_tube_login/widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white, title: const Text('LOGIN')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150.0),
                const Text(
                  'Get started',
                  textHeightBehavior: TextHeightBehavior(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold, height: 0.8),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login to continue',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 70.0),
                MyTextfield(controller: emailController, lableText: 'Email'),
                const SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpVerificationScreen()));
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Ink(
                    height: 45,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 18)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    Expanded(child: Divider())
                  ],
                ),
                const SizedBox(height: 40.0),
                myButton('Continue with google', 'assets/icons/google.webp'),
                // const SizedBox(height: 10.0),
                // myButton('Continue With Facebook', 'assets/icons/facebook.png'),
                const SizedBox(height: 10.0),

                // const Spacer(),
                const SizedBox(height: 70),
                const Text('by continuing, you agree to our'),
                const SizedBox(height: 8.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textButton('term of service', () {}),
                    const SizedBox(width: 15.0),
                    textButton('privacy policy', () {}),
                    const SizedBox(width: 15.0),
                    textButton('content policies', () {}),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Text(
                  'Powered By Heartinz \n©2020 Heartinz Technologies Pvt Ltd',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector textButton(String text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text,
          style: const TextStyle(
              shadows: [Shadow(offset: Offset(0, -4), color: Colors.grey)],
              fontSize: 12,
              decoration: TextDecoration.underline,
              color: Colors.transparent,
              decorationThickness: 1.5,
              decorationColor: Colors.grey)),
    );
  }

  InkWell myButton(String text, [String? icon, bool? boldText]) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {},
      child: Ink(
        height: 45,
        decoration: BoxDecoration(
            color: primaryColor_50, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Image.asset(
                    icon,
                    height: 20,
                  )
                : const SizedBox(),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: TextStyle(color: primaryColor),
            ),
          ],
        )),
      ),
    );
  }
}
