import 'package:flutter/material.dart';
import 'package:saas/signup_screen.dart';

import 'homescreen.dart';

class SkipButton extends StatelessWidget {
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
        centerTitle: true,
        title: Image.asset(
          'assets/saas.logo.jpg',
          width: 150, // Adjust the width as needed for iPhone dimensions
          height: 40, // Adjust the height as needed for iPhone dimensions
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select your country, region, and language for shopping',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Choose Country',
                labelText: 'Country',
              ),
              items: [
                'Egypt',
                'Saudi Arabia',
                'United Arab Emirates',
                // Add more countries as needed
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle country selection
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Choose Language',
                labelText: 'Language',
              ),
              items: [
                'Arabic',
                'English',
                'Español',
                'Français',
                // Add more languages as needed
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle language selection
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFffd715),
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
