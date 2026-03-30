import 'package:community_pot/login.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedRole = 'Donor';

  final List<Map<String, dynamic>> roles = [
    {
      'title': 'Donor',
      'subtitle': 'Restaurants, grocery stores, and cafes with surplus food.',
      'icon': Icons.storefront_outlined,
      'color': const Color(0xFFE8F5E9),
      'iconColor': const Color(0xFF2E7D32),
    },
    {
      'title': 'Charity',
      'subtitle':
          'Non-profits and shelters distributing food to those in need.',
      'icon': Icons.favorite_border,
      'color': const Color(0xFFFFF3E0),
      'iconColor': const Color(0xFFEF6C00),
    },
    {
      'title': 'Volunteer',
      'subtitle': 'Drivers and helpers transporting food donations.',
      'icon': Icons.moped_outlined,
      'color': const Color(0xFFE3F2FD),
      'iconColor': const Color(0xFF1565C0),
    },
    {
      'title': 'Admin',
      'subtitle': 'Platform managers overseeing operations.',
      'icon': Icons.shield_outlined,
      'color': const Color(0xFFF5F5F5),
      'iconColor': const Color(0xFF616161),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFFE8F5E9),
                child: Icon(
                  Icons.energy_savings_leaf_outlined,
                  color: Colors.green[800],
                  size: 30,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Join the\nMovement Against\nFood Waste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Select your role to get started',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    final role = roles[index];
                    bool isSelected = selectedRole == role['title'];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => selectedRole = role['title']),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFF1F8E9)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ?  Color(0xFF2E7D32)
                                  : Colors.grey.shade200,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset:  Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding:  EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: role['color'],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  role['icon'],
                                  color: role['iconColor'],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      role['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                     SizedBox(height: 4),
                                    Text(
                                      role['subtitle'],
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isSelected
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: isSelected
                                    ? const Color(0xFF2E7D32)
                                    : Colors.grey.shade300,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFF236944),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
