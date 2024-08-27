import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final onTap;
  final Color color;
  const LoginButton({super.key,required this.onTap,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withOpacity(0.1),
        child: Ink(
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0),
              ),
            )),
      ),
    );
  }
}
