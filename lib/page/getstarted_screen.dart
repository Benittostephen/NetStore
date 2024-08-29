import 'package:flutter/material.dart';

import '../widgets/button.dart';
import 'business_screen.dart';

class GetStartedScreen extends StatelessWidget {
  final Color butColor;

  const GetStartedScreen({super.key, required this.butColor});

  @override
  Widget build(BuildContext context) {
    void _getStarted() async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BusinessScreen(color: butColor)));
    }

    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/new.png',
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Create your first store',
                        style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'You haven’t created any store',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 70),
                MyButton(
                    buName: 'Get Started', color: butColor, onTap: _getStarted),
              ],
            ),
          ),
        ));
  }
}
