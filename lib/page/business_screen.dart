import 'package:flutter/material.dart';

import '../widgets/create_button.dart';
import '../widgets/dropdown_button.dart';
import 'category_screen.dart';

final _formKey1 = GlobalKey<FormState>();

class BusinessScreen extends StatefulWidget {
  final Color color;
  final void Function(String title, String category) onTap;

  const BusinessScreen({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  TextEditingController titleController = TextEditingController();
  String? _selectedCategory;

  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your title';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Create NetStore Business',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset('assets/store.png', scale: 1.4),
                    SizedBox(width: 5),
                    Text('Business title')
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _myTextField(
                    titleController, 'Enter your title', _validateTitle),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownTextField(
                  label: _selectedCategory ?? 'Choose Category',
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        _selectedCategory = result;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'By clicking Create you agree to Heartinz’s Terms of Service and Privacy Policy',
                  style: TextStyle(
                      color: Color(0xFFF717171),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (_formKey1.currentState!.validate()) {
              //         if (_selectedCategory != null) {
              //           widget.onTap(titleController.text, _selectedCategory!);
              //         } else {
              //           // Handle case where category is not selected
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(
              //               content: Text('Please select a category'),
              //             ),
              //           );
              //         }
              //       }
              //     },
              //     child: Text('Create'),
              //   ),
              // ),
              // Alternatively, use the custom CreateButton widget if needed
              CreateButton(
                onTap: () =>
                    widget.onTap(titleController.text, _selectedCategory ?? ''),
                category: _selectedCategory ?? '',
                title: titleController.text,
                color: widget.color,
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _myTextField(TextEditingController controller, String labelText,
      String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFFC6C6C6), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: widget.color, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFFF454545),
        ),
      ),
      validator: validator,
    );
  }
}
