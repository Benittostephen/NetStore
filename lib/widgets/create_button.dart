import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final Color color;
  final String title;
  final String? category;
  final Function(String title, String category) onTap;

  const CreateButton({
    super.key,
    required this.color,
    required this.title,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (titile,categroy) {
      //
      //   },
      child: InkWell(
        //borderRadius: BorderRadius.circular(5),
        onTap: () => onTap(title, category!),
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withOpacity(0.1),
        child: Ink(
            height: 70,
            decoration: BoxDecoration(
              color: color,
            ),
            child: Center(
              child: Text(
                'Create',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0),
              ),
            )),
      ),
    );
    ;
  }
}
