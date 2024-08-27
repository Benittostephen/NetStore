import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Image.network(
                'https://s3-alpha-sig.figma.com/img/3214/d5b3/e1fc4147bae9adc6f3a148c32c9e5f6f?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=G7F05IEInp~0uJ-H0A1ceVQWYax8l3tz~4vRU0Q2oliUJN9G7ezwfWEcxLIUfTM8LkkeKJoL0McEACsq~E~RkB7958aGzWw5CdRUaQvhVTlSTPhTUlCQE4XybejQdyR-I4Pp668sA7T4PAyUogaJ80UlbTXCRElvvFsFf1e75prSQ2IUJQl5ar2SKt0QCziVxVyauoPE4uud39MDW5rtgXW6n-dPZ7UloAt~hK2yJSt9Gk2u4J2MoM2Svz7EofXg2dnSm6cNz0AbspBKP-1nQ7rGYcZobov0cArWsNjeCKCoHQ26gOSd~ZgA~SpIBQuvPlaKkqEhTj6CYuTmdUSCGg__')
          ],
        ));
  }
}
