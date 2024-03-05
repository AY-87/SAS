import 'package:flutter/material.dart';
import 'package:saas/skipbutton.dart';
import 'create.account.dart';
import 'login_screen.dart'; // Import the LoginScreen

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = 200.0; // Set a fixed width for all buttons

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9CD8E0),
        leading: Image.asset(
          'assets/saas.logo.jpg',
          width: 150, // Adjust the width as needed for iPhone dimensions
          height: 20, // Adjust the height as needed for iPhone dimensions
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text(
              'Sign in for the best shopping experience',
              style: TextStyle(
                fontSize: 16, // Adjusted font size for better visibility
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFffd715),
                onPrimary: Colors.black,
                fixedSize: Size(buttonWidth, 40), // Set a fixed size for all buttons
                textStyle: TextStyle(fontSize: 16), // Adjusted font size for better visibility
              ),
              child: Text('Sign In'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFe9eaec),
                onPrimary: Colors.black,
                fixedSize: Size(buttonWidth, 40), // Set a fixed size for all buttons
                textStyle: TextStyle(fontSize: 16), // Adjusted font size for better visibility
              ),
              child: Text('Create an Account'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SkipButton()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFe9eaec),
                onPrimary: Colors.black,
                fixedSize: Size(buttonWidth, 40), // Set a fixed size for all buttons
                textStyle: TextStyle(fontSize: 16), // Adjusted font size for better visibility
              ),
              child: Text('Skip'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle forgot password button press
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 14), // Adjusted font size for better visibility
              ),
            ),
          ],
        ),
      ),
    );
  }
}
