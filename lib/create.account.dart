import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saas/signup_screen.dart';
import 'package:saas/verification.dart';
import 'api.dart';
import 'login_screen.dart'; // Import the LoginScreen

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthServices auth = AuthServices();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  String passwordError = '';

  Future<void> registerData(String username, String phone, String password) async {
    if (password.length < 6) {
      setState(() {
        passwordError = 'Password must be at least 6 characters';
      });
      return;
    } else {
      setState(() {
        passwordError = '';
      });
    }

    try {
      final response = await http.post(
        Uri.parse('https://safelyy.store/api/Register'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          "username": username,
          "phone_number": phone,
          "password": password,
          // Add other necessary parameters
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        var data = json.decode(response.body);
        print('Registration Successful: $data');
      } else {
        // Registration failed
        print('Registration Failed: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during registration: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9CD8E0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
        ),
        title: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Already have an account? ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Enter Phone Number with Country Code',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ContainerTextField(
              controller: phoneController,
              hintText: '+20 Phone Number',
              subText: 'Phone Number with Country Code',
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ContainerTextField(
              controller: usernameController,
              hintText: 'Username',
              subText: 'Username',
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ContainerTextField(
              controller: passwordController,
              hintText: 'Password',
              subText: 'Password',
              isPassword: true,
              obscureText: !showPassword,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              passwordError,
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Checkbox(
                  value: showPassword,
                  onChanged: (value) {
                    // Handle checkbox state change
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                Text(
                  'Show Password',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle continue button press (Check phone number)
              String username = usernameController.text;
              String phone = phoneController.text;
              String password = passwordController.text;
              // Call your registerData function with the extracted values
              registerData(username, phone, password);

              // Navigate to the verification screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationScreen(phoneNumber: phone)),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFffd715),
              onPrimary: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              textStyle: TextStyle(fontSize: 20),
            ),
            child: Text('Verify Phone Number'),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ContainerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String subText;
  final bool isPassword;
  final bool obscureText;

  const ContainerTextField({
    required this.controller,
    required this.hintText,
    required this.subText,
    this.isPassword = false,
    this.obscureText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subText,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            TextFormField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
