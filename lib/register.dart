import 'package:community_pot/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/image.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 30),  
              const Text(
                'Join Community Pot',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D1B2A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create an account to start making an impact',
                style: TextStyle(color: Colors.blueGrey, fontSize: 14),
              ),
              SizedBox(height: 40),

              labeltext("Full Name"),
              textform("John Doe"),
              const SizedBox(height: 20),

              labeltext("Email Address"),
              textform("name@example.com"),
              const SizedBox(height: 20),

              labeltext("Password"),
              textform("••••••••", isPassword: true),
              const SizedBox(height: 20),

              const SizedBox(height: 40),
              button("Create Account"),

              SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: text("Already have an account? ", "Log In"),
              ),

              const SizedBox(height: 60),
              Text(
                "SAVING FOOD, SERVING COMMUNITY",
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget labeltext(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  );

  Widget textform(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }

  Widget button(String label) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4CAF50),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget text(String text, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: const TextStyle(color: Colors.blueGrey)),
        Text(
          action,
          style: const TextStyle(
            color: Color(0xFF53B155),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
