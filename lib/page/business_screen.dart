import 'package:flutter/material.dart';

import '../widgets/create_button.dart';
import '../widgets/dropdown_button.dart';
import 'category_screen.dart';


final _formKey1 = GlobalKey<FormState>();

class BusinessScreen extends StatefulWidget {
  final color;

  const BusinessScreen({super.key, required this.color});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  TextEditingController title = TextEditingController();
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
                child: _mytextfield(title, 'Enter your title', _validateTitle),
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
                  )),
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
              CreateButton(
                onTap: (String title, String category) {
                  if (_formKey1.currentState?.validate() ?? false) {
                    if (category != '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Successfully Created!')),
                      );
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             NextPage(title: title, category: category)));
                    } else {
                      // Show an error message if category is not selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a category')),
                      );
                    }
                  }
                  // Handle the tap event here
                  print('Title: $title, Category: $category');
                },
                category: _selectedCategory ?? '',
                title: title.text,
                color: widget.color,
              )
              /*button('Create', () {
                if (_formKey1.currentState?.validate() ?? false) {
                  final enteredTitle = title.text;
                  final selectedCategory = _selectedCategory;

                  // Pass the title and category values
                  _onCreatePressed(enteredTitle, selectedCategory);
                }
              }),*/
            ],
          ),
        ),
      ),
    );
  }

/*  void _onCreatePressed(String title, String? category) {
    // Handle the title and category values
    print('Title: $title');
    print('Category: $category');

    // Add your logic here, for example:
    if (category != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NextPage(title: title, category: category)));
    } else {
      // Show an error message if category is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a category')),
      );
    }
  }*/

/*  GestureDetector button(String name, onTap) {
    return GestureDetector(
      child: InkWell(
        //borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withOpacity(0.1),
        child: Ink(
            height: 70,
            decoration: BoxDecoration(
              color: widget.color,
              //  borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0),
              ),
            )),
      ),
    );
  }*/

  TextFormField _mytextfield(TextEditingController controller, String lableText,
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
            //borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          labelText: lableText,
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFFF454545),
          )),
      validator: validator,
    );
  }
}
