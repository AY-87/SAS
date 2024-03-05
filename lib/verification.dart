import 'dart:convert';
import 'package:flutter/material.dart';
import 'create.account.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber; // Pass the phone number to this screen

  VerificationScreen({required this.phoneNumber});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController verificationCodeController = TextEditingController();
  final TextEditingController reenterCodeController = TextEditingController();

  Future<void> verifyCode(String verificationCode, String reenterCode) async {
    // Implement code verification logic with the database
    // If codes are correct, redirect to the next screen
    // Otherwise, handle the error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9CD8E0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CreateAccount()),
            );
          },
        ),
        title: Text(
          'Phone Number Verification',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Your phone number:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.phoneNumber,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ContainerTextField(
              controller: verificationCodeController,
              hintText: 'Enter Verification Code',
              subText: 'Verification Code',
            ),
            SizedBox(height: 20),
            ContainerTextField(
              controller: reenterCodeController,
              hintText: 'Re-enter Verification Code',
              subText: 'Re-enter Code',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String verificationCode = verificationCodeController.text;
                String reenterCode = reenterCodeController.text;
                verifyCode(verificationCode, reenterCode);
                // Implement logic to check codes and redirect if correct
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFffd715),
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Create Account'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Implement navigation to the terms and conditions screen
                //Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                // );
              },
              child: Text(
                'By creating an account, you agree to our terms and conditions.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String subText;

  const ContainerTextField({
    required this.controller,
    required this.hintText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
