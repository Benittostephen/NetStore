import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Book',
    'Note',
    'Note2',
    'Note3',
    'Note4',
    'Note5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 24.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose category',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Center(
                    child: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF686868)),
                )),
                onTap: () {
                  Navigator.pop(context, categories[index]);
                },
              ),
              Divider(
                color: Color(0xFFFD4D4D4), // Color of the line
                thickness: 1.0, // Thickness of the line
                height: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
