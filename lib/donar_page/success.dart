import 'package:community_pot/donar_page/history.dart';
import 'package:flutter/material.dart';

class SuccessListingPage extends StatelessWidget {
  const SuccessListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Success Icon Section
              _buildSuccessIcon(),

              const SizedBox(height: 40),

              // Text Content
              const Text(
                'Listed Successfully!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your food donation is now live and visible to nearby NGOs and communities.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Action Buttons
              _buildActionButton(
                label: 'Back to Home',
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  ;
                  // Navigate to specific listing details
                },
                isPrimary: true,
              ),
              // const SizedBox(height: 12),
              // _buildActionButton(
              //   label: 'Back to Home',
              //   onPressed: () {
              //     Navigator.of(context).popUntil((route) => route.isFirst);
              //   },
              //   isPrimary: false,
              // ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // Very light green
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFF346345), // Forest Green
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_rounded, color: Colors.white, size: 50),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? const Color(0xFF346345) : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: isPrimary
                ? BorderSide.none
                : const BorderSide(color: Color(0xFFEEEEEE)),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isPrimary ? Colors.white : const Color(0xFF346345),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
