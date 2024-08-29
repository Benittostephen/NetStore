import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import 'getstarted_screen.dart';

final _formKey1 = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key,
      required this.title,
      required this.onTap,
      required this.email,
      required this.password,
      required this.appColor,
      required this.getStartscreenImage});

  final String title;
  final String email;
  final String password;
  final Color appColor;
  final String getStartscreenImage;
  final void Function(String title, String category) onTap;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_updatePasswordField);
  }

  @override
  void dispose() {
    passwordController.removeListener(_updatePasswordField);
    passwordController.dispose();
    super.dispose();
  }

  void _updatePasswordField() {
    setState(() {});
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Basic email format validation
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password validation criteria
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void _login() async {
    if (_formKey1.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      if (emailController.text == widget.email &&
          passwordController.text == widget.password) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GetStartedScreen(
                      butColor: widget.appColor,
                      onTap: widget.onTap,
                  image:widget.getStartscreenImage
                    )));
        emailController.clear();
        passwordController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Successfully Logined')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Wrong email or password!')));
        emailController.clear();
        passwordController.clear();
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              color: widget.appColor,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
              child: Form(
                key: _formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login to your Account',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    _mytextfield(
                        false, emailController, 'Email', _validateEmail, false),
                    SizedBox(height: 20),
                    _mytextfield(_obscureText, passwordController, 'Password',
                        _validatePassword, true),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot your Password?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFF5B5B5B)),
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    (_isLoading)
                        ? CircularProgressIndicator(
                            // color: primaryColor,
                            )
                        : Center(
                            child: MyButton(
                              onTap: _login,
                              color: widget.appColor,
                              buName: 'Continue',
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'By continuing, You agree to our ',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms and Conditions and Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFF009688), // Link color
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Add your onTap logic here
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField _mytextfield(bool obscureText, TextEditingController controller,
      String lableText, String? Function(String?) validator, prefixicon) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFFf5f5f5),
          suffixIcon: passwordController.text.isNotEmpty
              ? (prefixicon)
                  ? IconButton(
                      icon: Icon(
                        size: 18,
                        color: Colors.grey,
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _togglePasswordVisibility)
                  : null
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xFFFC6C6C6), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.appColor, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            //borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          labelText: lableText,
          labelStyle: TextStyle(
            color: Color(0xFFF454545),
          )),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
